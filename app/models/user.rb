class User < ApplicationRecord

  has_one_attached :user_pic

  after_create :welcome_send

  belongs_to :city, optional: true
  has_many :attendances, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :ratings
  has_many :rating_outlets
  has_many :rating_noise_levels
  has_many :rating_wifis
  has_many :rating_comforts
  has_many :favorite_places, through: :favorites, class_name: "Place"

  validate :validate_age

  validates :user_pic, content_type: ['image/png', 'image/jpg', 'image/jpeg'], size: { less_than: 1.megabyte , message: ': Ta photo doit être inférieure à 1 Mo.' }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def name
      return "#{first_name} #{last_name}"
  end

  def age
    if self.birth_date != nil
      birthday = self.birth_date
      now = Time.now
      return  (now.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000
    else
      return "Non renseigné"
    end
  end

  def rate_place(place, stars)
  	rating = self.ratings.find_by(place_id: place.id)
  	if rating
  		rating.stars = stars
  	else
  		rating = self.ratings.new(place_id: place.id, stars: stars)
  	end
  	return rating
  end

  def rate_place_outlets(place, outlets)
    rating = self.rating_outlets.find_by(place_id: place.id)
    if rating
      rating.outlets = outlets
    else
      rating = self.rating_outlets.new(place_id: place.id, outlets: outlets)
    end
    return rating
  end

  def rate_place_noise_levels(place, noise_levels)
    rating = self.rating_noise_levels.find_by(place_id: place.id)
    if rating
      rating.noise_levels = noise_levels
    else
      rating = self.rating_noise_levels.new(place_id: place.id, noise_levels: noise_levels)
    end
    return rating
  end

  def rate_place_wifis(place, wifis)
    rating = self.rating_wifis.find_by(place_id: place.id)
    if rating
      rating.wifis = wifis
    else
      rating = self.rating_wifis.new(place_id: place.id, wifis: wifis)
    end
    return rating
  end

  def rate_place_comforts(place, comforts)
    rating = self.rating_comforts.find_by(place_id: place.id)
    if rating
      rating.comforts = comforts
    else
      rating = self.rating_comforts.new(place_id: place.id, comforts: comforts)
    end
    return rating
  end
  
  def has_attendance(date)
  	return self.attendances.where(date: date).length != 0
  end

  def add_favorite(place)
		favorite = self.favorite_places.find_by(name: place.name)
		if !favorite
			favorite = Favorite.new(user: self, favorite_place: place)
		end
		return favorite
	end

  private

  def validate_age
    if birth_date.present? && birth_date > 0.years.ago.to_date
      errors.add(:birth_date, 'You must be born. Nice try !')
    end
  end
end
