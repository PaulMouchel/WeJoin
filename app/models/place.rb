class Place < ApplicationRecord
	has_many_attached :place_pics

	validates :name, presence: true
	validates :address, presence: true
	validates :place_pics, content_type: ['image/png', 'image/jpg', 'image/jpeg'], size: { less_than: 1.megabyte , message: ': Ta photo doit être inférieure à 1 Mo.' }

	belongs_to :city
	has_many :attendances, dependent: :destroy
	has_many :favorites, dependent: :destroy, foreign_key: "favorite_place_id"
	has_many :ratings, dependent: :destroy
	has_many :place_tags, dependent: :destroy
	has_many :tags, through: :place_tags

	def average_rating
		if self.ratings.length > 0
			ratings_sum = self.ratings.all.inject(0){|sum,e| sum + e.stars }
			ratings_average = ratings_sum.to_f/self.ratings.length
			return ratings_average
		else
			return 0.0
		end
	end

	def my_rating(user)
		rating = self.ratings.find_by(user: user)
		if rating != nil
			return rating.stars
		else
			return 0
		end
	end

	def is_favorite?(user)
		return false if user == nil
		return user.favorite_places.include?(self)
	end

	def all_tags=(names)
	  self.tags = names.split(",").map {|name| Tag.where(name: name.strip).first} - [nil]
	end

	def all_tags
	  self.tags.map(&:name).join(", ")
	end
end
