class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :avatar, :string
  end
end
