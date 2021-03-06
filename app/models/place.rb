class Place < ApplicationRecord

	after_create :new_place_send

	has_many_attached :place_pics
	validates :name, presence: true
	validates :address, presence: true
	validates :place_pics, content_type: ['image/png', 'image/jpg', 'image/jpeg'], size: { less_than: 1.megabyte , message: ': Ta photo doit être inférieure à 1 Mo.' }

	belongs_to :city
	has_many :attendances, dependent: :destroy
	has_many :favorites, dependent: :destroy, foreign_key: "favorite_place_id"
	has_many :ratings, dependent: :destroy
	has_many :rating_outlets, dependent: :destroy
	has_many :rating_noise_levels, dependent: :destroy
	has_many :rating_wifis, dependent: :destroy
	has_many :rating_comforts, dependent: :destroy
	has_many :place_tags, dependent: :destroy
	has_many :tags, through: :place_tags
	has_many :place_editions
	has_many :opening_hours, dependent: :destroy

	geocoded_by :address
	after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
	
	def new_place_send
		UserMailer.new_place_email(self).deliver_now
	end

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

	def average_rating_outlets
		if self.rating_outlets.length > 0
			ratings_sum = self.rating_outlets.all.inject(0){|sum,e| sum + e.outlets }
			ratings_average = ratings_sum.to_f/self.rating_outlets.length
			return ratings_average
		else
			return 0.0
		end
	end

	def my_rating_outlets(user)
		rating = self.rating_outlets.find_by(user: user)
		if rating != nil
			return rating.outlets
		else
			return 0
		end
	end

	def average_rating_noise_levels
		if self.rating_noise_levels.length > 0
			ratings_sum = self.rating_noise_levels.all.inject(0){|sum,e| sum + e.noise_levels }
			ratings_average = ratings_sum.to_f/self.rating_noise_levels.length
			return ratings_average
		else
			return 0.0
		end
	end

	def my_rating_noise_levels(user)
		rating = self.rating_noise_levels.find_by(user: user)
		if rating != nil
			return rating.noise_levels
		else
			return 0
		end
	end

	def average_rating_wifis
		if self.rating_wifis.length > 0
			ratings_sum = self.rating_wifis.all.inject(0){|sum,e| sum + e.wifis }
			ratings_average = ratings_sum.to_f/self.rating_wifis.length
			return ratings_average
		else
			return 0.0
		end
	end

	def my_rating_wifis(user)
		rating = self.rating_wifis.find_by(user: user)
		if rating != nil
			return rating.wifis
		else
			return 0
		end
	end

	def average_rating_comforts
		if self.rating_comforts.length > 0
			ratings_sum = self.rating_comforts.all.inject(0){|sum,e| sum + e.comforts }
			ratings_average = ratings_sum.to_f/self.rating_comforts.length
			return ratings_average
		else
			return 0.0
		end
	end

	def my_rating_comforts(user)
		rating = self.rating_comforts.find_by(user: user)
		if rating != nil
			return rating.comforts
		else
			return 0
		end
	end

	def is_favorite?(user)
		return false if user == nil
		return user.favorite_places.include?(self)
	end

	def all_tags=(names)
		names.delete("")
	  self.tags = names.map {|name| Tag.where(name: name.strip).first} - [nil]
	end

	def all_tags
	  self.tags.map(&:name)
	end

	def is_closed?
		hours = self.opening_hours.find_by(day_of_week: Time.now.wday)
		if hours != nil
			now = Time.at(Time.now.to_i % 86400 + 60*60*2)
			open = Time.at(hours.open.to_i % 86400)
			close = Time.at(hours.close.to_i % 86400)
			return hours.closed? || !now.between?(open, close)
		end
		return false
	end

	def is_open?
		hours = self.opening_hours.find_by(day_of_week: Time.now.wday)
		if hours != nil
			now = Time.at(Time.now.to_i % 86400 + 60*60*2)
			open = Time.at(hours.open.to_i % 86400)
			close = Time.at(hours.close.to_i % 86400)
			return now.between?(open, close)
		end
		return false
	end

	def will_be_close?(date)
		hours = self.opening_hours.find_by(day_of_week: date.wday)
		if hours != nil
			return hours.closed?
		end
		return false
	end
end
