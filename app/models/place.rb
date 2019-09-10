class Place < ApplicationRecord
	has_many_attached :place_pics

	validates :name, presence: true
	validates :address, presence: true

	belongs_to :city
	has_many :attendances, dependent: :destroy
	has_many :favorites, dependent: :destroy, foreign_key: "favorite_place_id"
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

	def is_favorite?(user)
		return user.favorite_places.include?(self)
	end
end
