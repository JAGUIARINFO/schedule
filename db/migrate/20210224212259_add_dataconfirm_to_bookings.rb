class AddDataconfirmToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :dataconfirm, :datetime
  end
end
