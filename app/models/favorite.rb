class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :favorite_place, class_name: "Place"
end
