class RemoveEventDataFromSpaces < ActiveRecord::Migration
  def change
    remove_column :spaces, :coffee, :boolean
    remove_column :spaces, :available, :boolean
    remove_column :spaces, :start_time, :time
    remove_column :spaces, :end_time, :time
  end
end
