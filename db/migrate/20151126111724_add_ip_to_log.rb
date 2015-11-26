class AddIpToLog < ActiveRecord::Migration
  def change
  	add_column :logs, :ip, :string
  end
end
