class AddSumToFields < ActiveRecord::Migration
  def change
  	add_column :fields, :sum, :boolean, default:false
  end
end
