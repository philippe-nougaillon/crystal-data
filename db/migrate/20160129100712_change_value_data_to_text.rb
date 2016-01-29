class ChangeValueDataToText < ActiveRecord::Migration
  def change
  	change_column :values, :data, :text
  end
end
