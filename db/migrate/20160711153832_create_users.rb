class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.string :avatar
      t.string :portfolio
      t.string :tags
      t.string :bio
      t.integer :price
      t.boolean :photog

      t.timestamps null: false
    end
  end
end
