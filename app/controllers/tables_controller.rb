# encoding: utf-8

class TablesController < ApplicationController
  before_action :authorize, except: [:fill, :fill_do]
  before_action :set_table, except: [:new, :create, :import, :import_do, :checkifmobile, :index, :log]

  # GET /tables
  # GET /tables.json
  def index
    session[:user_id] = @current_user.id if @current_user && session[:user_id].nil?
    @tables = @current_user.tables.includes(:fields)
     
    respond_to do |format|
      format.html.phone
      format.html.none 
    end
  end

  # GET /tables/1
  # GET /tables/1.json
  def show
    unless @table.users.include?(@current_user)
      redirect_to tables_path, alert:"Vous n'êtes pas un utilisateur connu de cette table ! Circulez, y'a rien à voir :)"
      return
    end

    @sum = Hash.new(0)
    @numeric_types = ['Formule','Euros','Nombre']
    @td_style = []
    @pathname = Rails.root.join('public', 'table_files') 

    # recherche les lignes 
    unless params.permit![:search].blank?
      @values = @table.values.where("data like ?", "%#{params.permit![:search].strip}%")      
    else
      @values = @table.values
    end
    @records_search = @values.pluck(:record_index).uniq

    # applique les filtres
    @records_filter = []
    if params[:select]
      params[:select].each do | option | 
        unless option.last.blank? 
          field = Field.find(option.first)
          filter_records = @table.values.where(field:field, data:option.last).pluck(:record_index) 
          if @records_filter.empty?
            @records_filter = filter_records 
          else
            @records_filter = @records_filter & filter_records 
          end  
        end
      end
    end

    # renvoyer les id des lignes cherchées puis filtrées 
    unless @records_filter.empty? 
      @records = @records_search & @records_filter
    else
      @records = @records_search
    end  

    unless params[:debut].blank? and params[:fin].blank?
      @debut = Time.parse(params[:debut]).strftime("%Y-%m-%d")
      @fin = Time.parse(params[:fin]).strftime("%Y-%m-%d")

      # calcule la date maximum de chaque ligne d'enregistrement 
      h = @table.values.group(:record_index).maximum(:updated_at)
      # selectionne les lignes modifées dans la période
      hash = h.select{|record| h[record].between?(@debut,@fin) }
      # retourne que les clés
      @records = hash.keys
    end

    if @table.lifo 
     # calcule la date maximum de chaque ligne d'enregistrement 
     h = @table.values.select("values.record_index").group("fields.row_order, values.record_index").maximum(:updated_at)
     # inverse le hash (keys <=> values) pour faire un tri par date et retourne les record_index
     @records = Hash[h.sort_by{|k, v| v}.reverse].keys & @records
    end     

    if params[:sort_by]
      # ordre de tri ASC/DESC
      order_by = (params[:sort_by] == session[:sort_by]) ? ((session[:order_by] == "DESC") ? "ASC" : "DESC") : "ASC"
      
      @records = @table.values.records_at(@records)
                              .where(field_id: params[:sort_by])
                              .order("data #{order_by}")
                              .pluck(:record_index)
      
      session[:sort_by] = params[:sort_by]
      session[:order_by] = order_by
    end

    respond_to do |format|
      format.html
      format.xls { headers["Content-Disposition"] = "attachment; filename=\"#{@table.name}-#{l(DateTime.now, format: :compact)}\"" }
    end 
  end

  def show_attrs
    unless @table.is_owner?(@current_user)
      flash[:notice] = "Désolé mais vous n'êtes pas son propriétaire !"
      redirect_to tables_path
      return
    end 
    @field = Field.new(table_id:@table.id)
    @fields = Field.datatypes.keys.to_a
  end

  # formulaire d'ajout / modification
  def fill
    if params[:record_index]
      # modification ligne existante
      @record_index = params[:record_index]
    else
      # ajout d'une ligne
      @record_index = @table.size + 1
    end
  end

  # formulaire d'ajout / modification posté
  def fill_do
    table = Table.find(params[:table_id])
    user = @current_user
    data = params[:data]
    record_index = data.keys.first
    values = data[record_index.to_s]

    inserts_log = []
    notif_items = []

    # update? = si données existent déjà, on les supprime avant pour pouvoir ajouter les données modifiées 
    update = table.values.where(record_index:record_index).any?
    # garde la date de dernière mise à jour
    created_at_date = table.values.where(record_index:record_index).first.created_at if update

    # quel champ a été modifié ?
    table.fields.each do |field|
      value = values[field.id.to_s]
      if field.obligatoire and value.blank?
        flash[:alert] = "Champ(s) obligatoire(s) manquant(s)"
        redirect_to action: 'fill', record_index: record_index
        return
      end  

      # enregistre le fichier
      if field.datatype == 'Fichier' 
        if value
          value = field.save_file(value)
        else 
          # si l'utilisateur n'a pas choisi de fichier
          # on passe pour ne pas écraser le fichier existant
          next
        end
      end

      if field.datatype == 'Formule'
         value = field.evaluate(values.values) # evalue le champ calculé
      end          
  
      # test si c'est un update ou new record
      old_value = table.values.find_by(record_index:record_index, field:field)

      if old_value
          if (old_value.data != value) and !(old_value.data.blank? and value.blank?)
            # supprimer les anciennes données
            table.values.find_by(record_index:record_index, field:field).delete

            # enregistrer les nouvelles données
            Value.create(field_id: field.id, 
                          record_index: record_index, 
                          data: value, 
                          created_at: created_at_date)
          end
      else
        # enregistrer les nouvelles données
        Value.create(field_id: field.id, 
                    record_index: record_index, 
                    data: value, 
                    created_at: created_at_date)

      end
    end

    # notifier l'utilisateur d'un ajout 
    if not update and table.notification
      UserMailer.notification(table, notif_items).deliver_later
    end

    if update
      redirect_to table
    else
      redirect_to :fill, notice: "Données ajoutées avec succès :)"
    end
  end  

  def delete_record
    unless @table.users.include?(@current_user)
      redirect_to tables_path, alert:"Vous n'êtes pas un utilisateur connu de cette table ! Circulez, y'a rien à voir :)"
      return
    end

    if params[:record_index]
      deletes_log = []
      record_index = params[:record_index].to_i
      @table.values.where(record_index:record_index).each do | value |
          # log l'action dans l'historique
          #deletes_log.push "(#{value.field.id}, #{@current_user.id}, \"#{"#{value.data} => ~"}\", '#{Time.now.to_s(:db)}', '#{Time.now.to_s(:db)}', #{record_index}, \"#{request.remote_ip}\", 3)"  

          # supprime le fichier lié
          if value.field.Fichier? and value.data
              value.field.delete_file(value.data)
              deletes_log.push "(#{value.field.id}, #{@current_user.id}, \"#{"fichier supprimé. #{value.data} => !"}\", '#{Time.now.to_s(:db)}', '#{Time.now.to_s(:db)}', #{record_index}, \"#{request.remote_ip}\", 3)"  
          end
          value.delete
      end

      # if deletes_log.any?
      #   sql = "INSERT INTO logs (`field_id`, `user_id`, `message`, `created_at`, `updated_at`, `record_index`, `ip`, `action`) VALUES #{deletes_log.join(", ")}"
      #   ActiveRecord::Base.connection.execute sql
      # end
      flash[:notice] = "Enregistrement ##{record_index} supprimé avec succès"
    end  

    redirect_to @table
  end

  # GET /tables/new
  def new
    @table = Table.new
  end

  # GET /tables/1/edit
  def edit
  end

  # POST /tables
  # POST /tables.json
  def create
    @table = Table.new(table_params)

    respond_to do |format|
      if @table.save
        @table.users << @current_user
        format.html { redirect_to show_attrs_path(id: @table), notice: "Table créée. Vous pouvez mantenant y ajouter des colonnes" }
        format.json { render :show, status: :created, location: @table }
      else
        format.html { render :new }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tables/1
  # PATCH/PUT /tables/1.json
  def update
    respond_to do |format|
      if @table.update(table_params)
        format.html { redirect_to show_attrs_path(id: @table), notice: 'Table modifiée.' }
        format.json { render :show, status: :ok, location: @table }
      else
        format.html { render :edit }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tables/1
  # DELETE /tables/1.json
  def destroy
    if @table.is_owner?(@current_user)
      # supprime les champs
      @table.fields.destroy_all

      # supprime les fichiers liés
      @table.values.each do | value |
          value.field.delete_file(value.data) if value.field and value.field.Fichier? and value.data
          value.destroy
        end
      
      @table.destroy
      flash[:notice] = "Table supprimée."
    else
      flash[:notice] = "Vous n'êtes pas son propriétaire !"
    end 
    respond_to do |format|
      format.html { redirect_to tables_url }
      format.json { head :no_content }
    end
  end

  def import
  end

  def import_do
    if params[:upload]
      require 'rake'

      #Save file to local dir
      filename = params[:upload].original_filename
      filename_with_path = Rails.root.join('public', 'tmp', filename)
      File.open(filename_with_path, 'wb') do |file|
          file.write(params[:upload].read)
      end

      Rake::Task.clear # necessary to avoid tasks being loaded several times in dev mode
      CrystalData::Application.load_tasks 
      Rake::Task['tables:import'].invoke(filename_with_path, filename, @current_user.id, request.remote_ip)

      @new_table = Table.last
      redirect_to tables_path, notice: "Importation terminé. Table '#{Table.last.name.humanize}' créée avec succès."
      return
    else
      redirect_to action: 'import', alert:"Il manque le fichier source"
    end  
  end

  def export
    unless @table.users.include?(@current_user)
      redirect_to tables_path, alert:"Vous n'êtes pas un utilisateur connu de cette table ! Circulez, y'a rien à voir :)"
      return
    end
  end

  def export_do
    require 'csv'

    unless params[:debut].blank? and params[:fin].blank?
      @debut = params[:debut]
      @fin = params[:fin]
    else
      @debut = '01/01/1900'
      @fin = '01/01/2100'
    end

    #updated_at_list = @table.values.group(:record_index).maximum(:updated_at)

    @records = @table.values.pluck(:record_index).uniq

    @csv_string = CSV.generate(col_sep:';') do |csv|
      csv << @table.fields.pluck(:name)

      @records.each do | index |
          values = @table.values.joins(:field).records_at(index).order("fields.row_order").pluck(:data)
          #updated_at = updated_at_list[index]
          cols = []
          @table.fields.each_with_index do | field,index |
            if field.datatype == "Signature" and values[index]
              cols << "Signé"
            else
              cols << (values[index] ? values[index].to_s.gsub("'", " ") : nil) 
            end
          end
          #cols << l(updated_at) 
          csv << cols
      end    
    end

    respond_to do |format|
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"#{@table.name.humanize}\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def add_user
  end

  def add_user_do
    unless params[:email].blank?
      @user = User.find_by(email:params[:email])
      if @user
        unless @table.users.exists?(@user)
          # ajoute le nouvel utilisateur aux utilisateurs de la table
          @table.users << @user 
          UserMailer.notification_nouveau_partage(@user, @table).deliver_later
          flash[:notice] = "Partage de la table '#{@table.name.humanize}' avec l'utilisateur '#{@user.name}' activé"
        else
          flash[:alert] = "Partage de la table '#{@table.name.humanize}' avec l'utilisateur '#{@user.name}' déjà existant !"
        end
      else
        flash[:alert] = "Utilisateur inconnu ! Créez un compte en allant sur 'Créer un compte' dans le menu utilisateur"
        redirect_to add_user_path(@table)
        return
      end
    else
      flash[:alert] = "Veuillez entrer une adresse mail svp."
      redirect_to add_user_path(@table)
      return
    end
    redirect_to partages_path(@table)
  end

  def partages
  end

  def partages_delete
    @user = User.find(params[:user_id])
    # supprime l'utilisateur que si ce n'est pas le dernier
    @table.users.delete(@user) if @table.users.count > 1
    flash[:notice] = "Le partage avec l'utilisateur '#{@user.name}' a été désactivé !"
    redirect_to partages_path
  end 

  def logs
    unless @table.users.include?(@current_user)
      redirect_to tables_path, alert:"Vous n'êtes pas un utilisateur connu de cette table ! Circulez, y'a rien à voir :)"
      return
    end

    # Afficher les changements pour la ligne #record_index
    if params[:record_index]
      sql = "audited_changes ->> 'record_index' = '#{params[:record_index].to_s}'"
      sql = sql + " AND ("
    else
      sql = "("  
    end    

    # et ayant comme champs ceux de la table en référence 
    @table.fields.each_with_index do |field, index|
       sql = sql + "(audited_changes ->> 'field_id' = '#{field.id.to_s}')"
       sql = sql + " OR " unless index == @table.fields.size - 1
    end
    sql = sql + ")"
  
    @audits = Audited::Audit.where(sql)
    @audits = @audits.reorder('created_at DESC').paginate(page: params[:page])
  end

  def activity
    unless @table.users.include?(@current_user)
      redirect_to tables_path, alert:"Vous n'êtes pas un utilisateur connu de cette table ! Circulez, y'a rien à voir :)"
      return
    end

    unless params[:type_action].blank?
      @logs = @table.logs.where(action:params[:type_action].to_i)
    else
      @logs = @table.logs.all
    end

    unless params[:user_id].blank?
      @logs = @logs.where(user_id:params[:user_id])
    end

    # applique les filtres
    @records_filter = []
    if params[:select]
      params[:select].each do | option | 
        unless option.last.blank? 
          field = Field.find(option.first)
          filter_records = @table.values.where(field:field, data:option.last).pluck(:record_index) 
          if @records_filter.empty?
            @records_filter = filter_records 
          else
            @records_filter = @records_filter & filter_records 
          end  
        end
      end
      @logs = @logs.where(record_index:@records_filter) if @records_filter.any?
    end

    @hash = @logs.group_by_day("logs.created_at").count
    fields_count = @table.fields.count

    # arroudir au multiple du nombre de champs supérieur
    @hash.each do |key,value| 
      if value % fields_count == 0 
        r = value / fields_count
      else
        r = value + fields_count - (value % fields_count) 
      end 
      #logger.debug "[DEBUG] value:#{value} fields:#{fields_count} r:#{r}"
      @hash[key] = r / fields_count
    end  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table
      @table = Table.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def table_params
      params.require(:table).permit(:name, :record_index, :lifo, :notification)
    end
end
