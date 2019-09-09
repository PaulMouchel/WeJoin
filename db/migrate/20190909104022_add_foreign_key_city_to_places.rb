class AddForeignKeyCityToPlaces < ActiveRecord::Migration[5.2]
  def change
  	add_foreign_key :places, :cities
  end
end
