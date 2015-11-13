# encoding: utf-8

class TablesController < ApplicationController
  before_filter :authorize
  before_action :set_table, only: [:show, :show_attrs, :add_user, :fill, :fill_do, :edit, :update, :destroy, :delete_record]

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
    @tables = @current_user.tables.includes(:fields)
  end

  # GET /tables/1
  # GET /tables/1.json
  def show
    @sum = Hash.new(0)

    unless params[:search].blank?
      @values = @table.values.where("data like ?", "%#{params[:search].strip}%")      
    else
      @values = @table.values
    end
    @records_search = @values.pluck(:record_index).uniq
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

    unless @records_filter.empty? 
      @records = @records_search & @records_filter
    else
      @records = @records_search
    end  

    respond_to do |format|
      format.html 
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

    if params[:todo_id]
      @todo = Todo.find(params[:todo_id])
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
        created_at_date = table.values.where(record_index:record_index).first.created_at

        # test quel champ a été modifié
        table.fields.each do |field|
          old_value = table.values.find_by(record_index:record_index, field:field)
          if old_value and (old_value.data != values[field.id.to_s]) and !(old_value.data.blank? and values[field.id.to_s].blank?)
              #logger.debug "DEBUG  #{field.name} modifié !!! old_value:#{old_value.data} | new_data: #{values[field.id.to_s]}"
              field.logs.create(user:user, record_index:record_index, message:"#{old_value.data} => #{values[field.id.to_s]}")
              table.values.find_by(record_index:record_index, field:field).destroy
              table.values.create(record_index:record_index, field_id:field.id, data:values[field.id.to_s], user_id:user.id, created_at:created_at_date)
          end
        end
      else
        # ajout des données
        table.fields.each do |field|
          @table.values.create(record_index:record_index, field_id:field.id, data:values[field.id.to_s], user_id:user.id, created_at:created_at_date )
        end
      end

      # maj du nombre de lignes si c'est un ajout
      table.update_attributes(record_index:record_index) if not update

      flash[:notice] = "Enregistrement #{update ? "modifié" : "ajouté"}"
    else
      flash[:notice] = "L'enregistrement n'a pas été ajouté"
    end

    respond_to do |format|
      format.html.phone { redirect_to todo }
      format.html.none  { redirect_to table }
    end
  end  

  def delete_record
    if params[:record_index]
      @table.values.where(record_index:params[:record_index]).destroy_all
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
    @table.users << @current_user

    respond_to do |format|
      if @table.save
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
      file_with_path = Rails.root.join('public', 'tmp', filename)
      File.open(file_with_path, 'wb') do |file|
          file.write(params[:upload].read)
      end

      # execute rake and capture output  
      @out = capture_stdout do
          Rake::Task['tables:import'].invoke(file_with_path, filename, @current_user.id)
      end
      @new_table = Table.last
    else
      flash[:alert] = "Il manque le fichier source"
      redirect_to action: 'import'
    end  
  end

  def add_user
  end

  def add_user_do
    @table = Table.find(params[:id])
    @user = User.find_by(email:params[:email])
    if @user
      unless @table.users.exists?(@user)
        @table.users << @user 
        flash[:notice] = "Utilisateur '#{@user.name}' ajouté"
      else
        flash[:alert] = "Utilisateur '#{@user.name}' déjà ajouté"
      end
    else
      flash[:alert] = "Utilisateur inconnu"
    end

    redirect_to tables_path
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
