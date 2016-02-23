class RemoveSumToField < ActiveRecord::Migration
  def change
  	remove_column :fields, :sum
  end
end
