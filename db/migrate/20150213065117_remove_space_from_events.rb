class RemoveSpaceFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :space_id, :integer
  end
end
