class User < ApplicationRecord
  has_one_attached :user_pic

  after_create :welcome_send

  belongs_to :city, optional: true
  has_many :attendances, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :ratings
  has_many :favorite_places, through: :favorites, class_name: "Place"

  validates :age, numericality: { only_integer: true, greater_than: 0}, :allow_nil => true

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
end
