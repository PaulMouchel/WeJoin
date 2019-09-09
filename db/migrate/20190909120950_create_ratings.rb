class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
    	t.belongs_to :user, index: true
    	t.belongs_to :place, index: true
      t.integer :stars

      t.timestamps
    end
  end
end
