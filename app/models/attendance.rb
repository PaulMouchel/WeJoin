class Attendance < ApplicationRecord
	validates :date, presence: true

	belongs_to :user
	belongs_to :place
end
