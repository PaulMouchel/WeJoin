class User < ApplicationRecord
  has_one_attached :user_pic

  after_create :welcome_send

  belongs_to :city, optional: true
  has_many :attendances, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :ratings
  has_many :favorite_places, through: :favorites, class_name: "Place"

  validate :validate_age

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

  def validate_age
    if birth_date.present? && birth_date > 0.years.ago.to_date
      errors.add(:birth_date, 'You must be born. Nice try !')
    end
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
end
