class AddWifiIdToPlaces < ActiveRecord::Migration[5.2]
  def change
  	add_column :places, :wifi_identification, :string
  end
end
