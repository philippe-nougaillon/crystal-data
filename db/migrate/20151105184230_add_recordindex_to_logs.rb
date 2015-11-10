class AddRecordindexToLogs < ActiveRecord::Migration
  def change
  	add_column :logs, :record_index, :integer, index:true
  end
end
