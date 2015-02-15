class DropSpacesAndBookingsTable < ActiveRecord::Migration
  def change
  	drop_table :spaces
  	drop_table :bookings
  end
end
