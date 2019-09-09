class Rating < ApplicationRecord
	validates :stars, inclusion: 1..5

	belongs_to :user
	belongs_to :place
end
