class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.date :datareserva
      t.integer :horareserva
      t.text :descricao

      t.timestamps
    end
  end
end
