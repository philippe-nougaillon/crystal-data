class AddFiltreToFields < ActiveRecord::Migration
  def change
  	add_column :fields, :filtre, :boolean, default:false
  end
end
