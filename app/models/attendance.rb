class Attendance < ApplicationRecord
	validates :date, presence: true
	validate :in_the_future?

	belongs_to :user
	belongs_to :place

	def start_time
    self.date
  end

  def users
  	attendances = Attendance.where(date: self.date, place: self.place)
  	return attendances.map{|attendance|attendance.user}
  end

  private

  def in_the_future?
  	#return self.start_date > Time.now
  	if self.date.present? && self.date < 1.day.ago
        errors.add(:date, "Pas de participation dans le passé !")
    end
  end
end
