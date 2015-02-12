class AddOwnersToBookings < ActiveRecord::Migration
  def change
    add_reference :bookings, :user, index: true
    add_foreign_key :bookings, :users
  end
end
