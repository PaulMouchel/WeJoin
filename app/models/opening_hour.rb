class OpeningHour < ApplicationRecord
  belongs_to :place
 
  def day_of_week
    Date::DAYNAMES[read_attribute(:day_of_week)]
  end
 
  # If you want to set the day of week value with a string
  def day_of_week=(value)
    day = Date::DAYNAMES.index(value)
    write_attribute(:day_of_week, day) if day.present?
  end
end

