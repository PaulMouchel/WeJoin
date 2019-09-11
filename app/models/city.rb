class City < ApplicationRecord
	has_one_attached :city_pic
	
	validates :name, presence: true

	validates :city_pic, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'], size: { less_than: 1.megabyte , message: ': Ta photo doit être inférieure à 1 Mo.' }

	has_many :users
	has_many :places, dependent: :destroy
end
