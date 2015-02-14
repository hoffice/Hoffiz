class AddDetailsToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :user, index: true
    add_foreign_key :events, :users
    add_column :events, :city, :string
    add_column :events, :country, :string
    add_column :events, :space_type, :string
    add_column :events, :wifi, :boolean
  end
end
