class CreatePlaceEditions < ActiveRecord::Migration[5.2]
  def change
    create_table :place_editions do |t|
      t.string :name
      t.string :address
      t.text :description
      t.float :coffee_price
      t.float :tea_price
      t.float :beer_price
      t.string :wifi_password
      t.belongs_to :place
      t.timestamps
    end
  end
end
