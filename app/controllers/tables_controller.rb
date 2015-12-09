# encoding: utf-8

class TablesController < ApplicationController
  before_filter :authorize
  before_action :set_table, except: [:new, :create, :import, :import_do, :checkifmobile, :index]

  #layout :checkifmobile

  def checkifmobile
    if request.variant and request.variant.include?(:phone) 
      return 'phone'  
    else
      return 'application'
    end
  end

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
    @sum = Hash.new(0)
    @numeric_types = ['formule','euros','nombre']

    # recherche les lignes 
    unless params[:search].blank?
      @values = @table.values.where("data like ?", "%#{params[:search].strip}%")      
    else
      @values = @table.values
    end
    @records_search = @values.pluck(:record_index).uniq

    # applique les filtres
    @records_filter = []
    if params[:select]
      params[:select].each_with_index do | option, index | 
        unless option.last.blank? 
          field = @table.fields.filtres[index]
          filter_records = @table.values.where(field:field, data:option.last).pluck(:record_index) 
          if @records_filter.empty?
            @records_filter = filter_records 
          else
            @records_filter = @records_filter & filter_records 
          end  
        end
      end
    end

    # revoie les id des lignes cherchées puis filtrées 
    unless @records_filter.empty? 
      @records = @records_search & @records_filter
    else
      @records = @records_search
    end  

    if params[:sort_by]
      # ordre de tri ASC/DESC
      order_by = (params[:sort_by] == session[:sort_by]) ? ((session[:order_by] == "DESC") ? "ASC" : "DESC") : "ASC"
      if params[:sort_by] == '0' # tri sur la date de maj de la ligne
         # calcul la date maximume par enregistrement 
         h = @table.values.group(:record_index).maximum(:updated_at)
         # retourne le hash pour faire un tri par date et retourne les record_index
         @records = Hash[h.sort_by{|k, v| v}.reverse].keys

      else
         @records = @table.values.records_at(@records).where(field_id:params[:sort_by]).order("data #{order_by}").pluck(:record_index)
      end 
      session[:sort_by] = params[:sort_by]
      session[:order_by] = order_by
    end

    respond_to do |format|
      format.html.phone
      format.html.none 
      format.xls { headers["Content-Disposition"] = "attachment; filename=\"#{@table.name}-#{l(DateTime.now, format: :compact)}\"" }
    end 
  end

  def show_attrs
    @field = Field.new(table_id:@table.id)
  end

  def fill
    if params[:record_index]
      @record_index = params[:record_index]
    else
      @record_index = @table.record_index + 1
    end

    respond_to do |format|
      format.html.phone 
      format.html.none
    end
  end

  def fill_do
    table = Table.find(params[:table_id])
    user = @current_user
    data = params[:data]
    record_index = data.first.first
    values = data[record_index.to_s]

    if values.values.select{|v| v.present? }.any? # test si tous les champs sont renseignés 

      # # modification = si données existent déjà, on les supprime pour pouvoir ajouter les données modifiées 
      update = table.values.where(record_index:record_index).any?
      if update 
        # garde la date de dernière mise à jour
        created_at_date = table.values.where(record_index:record_index).first.created_at

        # test quel champ a été modifié
        table.fields.each do |field|
          old_value = table.values.find_by(record_index:record_index, field:field)
          if old_value 
              if (old_value.data != values[field.id.to_s]) and !(old_value.data.blank? and values[field.id.to_s].blank?)
                # enregistre les modifications dans l'historique
                field.logs.create(user:user, record_index:record_index, ip:request.remote_ip, message:"#{old_value.data} => #{values[field.id.to_s]}")
                # supprimer les anciennes données
                table.values.find_by(record_index:record_index, field:field).delete
                # enregistrer les nouvelles données
                table.values.create(record_index:record_index, field_id:field.id, data:values[field.id.to_s], user_id:user.id, created_at:created_at_date)
              end
          else
            # enregistre les modifications dans l'historique
            field.logs.create(user:user, record_index:record_index, ip:request.remote_ip, message:"=> #{values[field.id.to_s]}")
            # enregistrer les nouvelles données
            table.values.create(record_index:record_index, field_id:field.id, data:values[field.id.to_s], user_id:user.id, created_at:created_at_date)
          end
        end
      else
        # ajout des données
        table.fields.each do |field|
          # enregistre les ajouts dans l'historique
          field.logs.create(user:user, record_index:record_index, ip:request.remote_ip, message:values[field.id.to_s])
          # enregistrer les nouvelles données
          table.values.create(record_index:record_index, field_id:field.id, data:values[field.id.to_s], user_id:user.id, created_at:created_at_date )
        end
      end

      # maj du nombre de lignes si c'est un ajout
      table.update_attributes(record_index:record_index) unless update

      flash[:notice] = "Enregistrement ##{record_index} #{update ? "modifié" : "ajouté"} avec succès"
    else
      flash[:alert] = "L'enregistrement n'a pas pu être ajouté"
    end

    respond_to do |format|
      format.html.phone { redirect_to tables_path }
      format.html.none { redirect_to table }
    end
  end  


  def delete_record
    if params[:record_index]
      record_index = params[:record_index]
      @table.values.where(record_index:record_index).each do |value|
          value.field.logs.create(user_id:@current_user.id, ip:request.remote_ip,record_index:record_index, message:"ligne supprimée. #{value.data} => !")
          value.delete
      end
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
        format.html { redirect_to show_attrs_path(id:@table), notice: 'Table ajoutée.' }
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
        format.html { redirect_to show_attrs_path(id:@table), notice: 'Table modifiée.' }
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
    @table.destroy
    respond_to do |format|
      format.html { redirect_to tables_url, notice: 'Table supprimée.' }
      format.json { head :no_content }
    end
  end

  def import
  end

  def import_do
    if params[:upload]
      require 'rake'
      Rake::Task.clear # necessary to avoid tasks being loaded several times in dev mode
      CrystalData::Application.load_tasks 

      #Save file to local dir
      filename = params[:upload].original_filename
      filename_with_path = Rails.root.join('public', 'tmp', filename)
      File.open(filename_with_path, 'wb') do |file|
          file.write(params[:upload].read)
      end

      #execute rake and capture output  
      @out = capture_stdout do
         Rake::Task['tables:import'].invoke(filename_with_path, filename, @current_user.id, request.remote_ip)
      end
      
      #ImportTableJob.perform_later(filename_with_path, filename, @current_user.id) 

      @new_table = Table.last
      redirect_to tables_path, notice: "import en cours... veuillez patienter "
      return
    else
      flash[:alert] = "Il manque le fichier source"
      redirect_to action: 'import'
    end  
  end

  def add_user
  end

  def add_user_do
    unless params[:email].blank?
      @user = User.find_by(email:params[:email])
      if @user
        unless @table.users.exists?(@user)
          @table.users << @user 
          flash[:notice] = "Partage de la table '#{@table.name.humanize}' avec l'utilisateur '#{@user.name}' activé"
        else
          flash[:alert] = "Partage de la table '#{@table.name.humanize}' avec l'utilisateur '#{@user.name}' déjà existant !"
        end
      else
        flash[:alert] = "Utilisateur inconnu ! Demandez-lui de s'incrire d'abord."
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table
      @table = Table.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def table_params
      params.require(:table).permit(:name, :record_index)
    end
end
