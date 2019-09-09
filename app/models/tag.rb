class Tag < ApplicationRecord
	validates :name, presence: true

	has_many :place_tags, dependent: :destroy
	has_many :places, through: :place_tags
end
