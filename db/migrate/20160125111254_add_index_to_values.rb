class AddIndexToValues < ActiveRecord::Migration
  def change
  	add_index :values, [:table_id, :record_index]
  end
end
