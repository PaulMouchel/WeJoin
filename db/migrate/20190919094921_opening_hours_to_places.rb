class OpeningHoursToPlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :opening_hours do |t|
      t.belongs_to :place, index: true
      t.integer :day_of_week
      t.time :open
      t.time :close
      t.datetime :valid_from
      t.datetime :valid_through
    end    
  end
end
