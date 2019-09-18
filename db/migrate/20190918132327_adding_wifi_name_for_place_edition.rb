class AddingWifiNameForPlaceEdition < ActiveRecord::Migration[5.2]
  def change
  	add_column :place_editions, :wifi_identification, :string
  end
end
