class Attendance < ApplicationRecord
	validates :date, presence: true

	belongs_to :user
	belongs_to :place

	def start_time
    self.date
  end

  def users
  	attendances = Attendance.where(date: self.date, place: self.place)
  	return attendances.map{|attendance|attendance.user}
  end
end
