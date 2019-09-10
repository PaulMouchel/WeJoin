class City < ApplicationRecord
	has_one_attached :city_pic
	
	validates :name, presence: true

	has_many :users
	has_many :places, dependent: :destroy
end
