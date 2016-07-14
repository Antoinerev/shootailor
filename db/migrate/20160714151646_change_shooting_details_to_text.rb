class ChangeShootingDetailsToText < ActiveRecord::Migration
  def change
    change_column :bookings, :shooting_details, :text
  end
end
