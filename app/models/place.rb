class Place < ApplicationRecord
	validates :name, presence: true
	validates address, presence: true

	belongs_to :city
	has_many :attendances, dependent: :destroy
	has_many :favorites dependent: :destroy
	has_many :ratings dependent: :destroy
	has_many :place_tags, dependent: :destroy
	has_many :tags, through: :place_tags
end
