class RemoveSeatsFromSpaces < ActiveRecord::Migration
  def change
    remove_column :spaces, :seats, :integer
  end
end
