class AddActionToLog < ActiveRecord::Migration
  def change
  	add_column :logs, :action, :integer, index:true
  end
end
