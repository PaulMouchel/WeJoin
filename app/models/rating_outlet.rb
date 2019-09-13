class RatingOutlet < ApplicationRecord
	validates :outlets, inclusion: 1..5, presence: true

	belongs_to :user
	belongs_to :place
end
