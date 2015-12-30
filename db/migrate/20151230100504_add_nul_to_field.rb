class AddNulToField < ActiveRecord::Migration
  def change
  	add_column :fields, :obligatoire, :boolean, default:false
  end
end
