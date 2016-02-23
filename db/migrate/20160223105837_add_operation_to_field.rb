class AddOperationToField < ActiveRecord::Migration
  def change
  	add_column :fields, :operation, :integer, index:true
  end
end
