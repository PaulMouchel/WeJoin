class CreateRatingComforts < ActiveRecord::Migration[5.2]
  def change
    create_table :rating_comforts do |t|
    	t.belongs_to :user, index: true
    	t.belongs_to :place, index: true
        t.integer :comforts

      t.timestamps
    end
  end
end
