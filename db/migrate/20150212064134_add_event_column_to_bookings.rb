class AddEventColumnToBookings < ActiveRecord::Migration
  def change
    add_reference :bookings, :event, index: true
    add_foreign_key :bookings, :events
  end
end
