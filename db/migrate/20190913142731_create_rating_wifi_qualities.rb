class CreateRatingWifiQualities < ActiveRecord::Migration[5.2]
  def change
    create_table :rating_wifi_qualities do |t|
    	t.belongs_to :user, index: true
    	t.belongs_to :place, index: true
        t.integer :rating_wifi_qualities

        t.timestamps
    end
  end
end
