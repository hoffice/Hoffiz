class AddOwnerToSpaces < ActiveRecord::Migration
  def change
    add_reference :spaces, :user, index: true
    add_foreign_key :spaces, :users
  end
end
