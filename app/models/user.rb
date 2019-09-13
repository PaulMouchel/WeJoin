class User < ApplicationRecord

  has_one_attached :user_pic

  after_create :welcome_send

  belongs_to :city, optional: true
  has_many :attendances, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :ratings
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

  def has_attendance(date)
  	return self.attendances.where(date: date).length != 0
  end

  private

  def validate_age
    if birth_date.present? && birth_date > 0.years.ago.to_date
      errors.add(:birth_date, 'You must be born. Nice try !')
    end
  end
end
