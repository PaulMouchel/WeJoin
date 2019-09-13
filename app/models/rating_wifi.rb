class RatingWifi < ApplicationRecord
	validates :wifis, inclusion: 1..5, presence: true

	belongs_to :user
	belongs_to :place
end
