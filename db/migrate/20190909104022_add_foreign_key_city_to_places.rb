class AddForeignKeyCityToPlaces < ActiveRecord::Migration[5.2]
  def change
  	add_reference :places, :city, index: true
  end
end
