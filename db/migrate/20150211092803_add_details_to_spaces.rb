class AddDetailsToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :title, :string
    add_column :spaces, :description, :text
    add_column :spaces, :city, :string
    add_column :spaces, :country, :string
    add_column :spaces, :space_type, :string
    add_column :spaces, :seats, :integer
    add_column :spaces, :coffee, :boolean
    add_column :spaces, :wifi, :boolean
    add_column :spaces, :available, :boolean
    add_column :spaces, :start_time, :time
    add_column :spaces, :end_time, :time
  end
end
