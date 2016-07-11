class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      # t.references :photog_id, index: true, foreign_key: true
      # t.references :client_id, index: true, foreign_key: true
      t.integer :photog_id
      t.integer :client_id
      t.string :client_needs
      t.string :shooting_location
      t.datetime :shooting_on
      t.string :shooting_price
      t.string :shooting_details
      t.string :status

      t.timestamps null: false
    end
  end
end
