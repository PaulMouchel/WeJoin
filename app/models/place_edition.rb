class PlaceEdition < ApplicationRecord
  has_many_attached :place_pics

  belongs_to :place
end
