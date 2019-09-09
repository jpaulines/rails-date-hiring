class AddApprovedDefaultToBookings < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :approved, :boolean, default: false
  end
end
