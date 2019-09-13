class CreateRatingWifis < ActiveRecord::Migration[5.2]
  def change
    create_table :rating_wifis do |t|
    	t.belongs_to :user, index: true
    	t.belongs_to :place, index: true
        t.integer :wifis

      t.timestamps
    end
  end
end
