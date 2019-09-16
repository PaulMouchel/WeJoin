class CreateRatingNoiseLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :rating_noise_levels do |t|
    	t.belongs_to :user, index: true
    	t.belongs_to :place, index: true
        t.integer :noise_levels

        t.timestamps
    end
  end
end
