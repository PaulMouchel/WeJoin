class Rating < ApplicationRecord
	validates :stars, inclusion: 1..5
end
