class CreatePlaceEditionTags < ActiveRecord::Migration[5.2]
  def change
    create_table :place_edition_tags do |t|
      t.belongs_to :place_edition, foreign_key: true
      t.belongs_to :tag, foreign_key: true

      t.timestamps
    end
  end
end
