class Place < ApplicationRecord
	has_one_attached :place_pic

	validates :name, presence: true
	validates :address, presence: true

	belongs_to :city
	has_many :attendances, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :ratings, dependent: :destroy
	has_many :place_tags, dependent: :destroy
	has_many :tags, through: :place_tags

	def average_rating
		if self.ratings.length > 0
			ratings_sum = self.ratings.inject { |sum, rating| sum + rating.stars }
			ratings_average = ratings_sum.to_f/self.ratings.length
			return '%.1f' % ratings_average
		else
			return 0.0
		end
	end
end
