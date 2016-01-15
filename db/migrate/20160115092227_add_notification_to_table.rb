class AddNotificationToTable < ActiveRecord::Migration
  def change
  	add_column :tables, :notification, :boolean, default:false
  	add_column :tables, :lifo, :boolean, default:false
  end
end
