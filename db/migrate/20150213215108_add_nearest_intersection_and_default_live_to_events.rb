class AddNearestIntersectionAndDefaultLiveToEvents < ActiveRecord::Migration
  def change
    add_column :events, :near, :string
    change_column :events, :live, :boolean, :default => true
  end
end
