class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.text :description
      t.float :coffee_price
      t.float :tea_price
      t.float :beer_price
      t.string :wifi_password

      t.timestamps
    end
  end
end
