class ChangeColumnOnFavorite < ActiveRecord::Migration[5.2]
  def change
  	remove_column :favorites, :place_id
  	add_column :favorites, :favorite_place_id, :integer
  end
end
