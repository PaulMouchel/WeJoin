class RatingWifiQuality < ApplicationRecord
	validates :wifi_qualities, inclusion: 1..5, presence: true

	belongs_to :user
	belongs_to :place
end
