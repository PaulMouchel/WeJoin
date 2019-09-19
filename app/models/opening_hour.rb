class OpeningHour < ApplicationRecord
  belongs_to :place

  validates :day_of_week, inclusion: 0..6, presence: true
  validates :open, presence: true
  validates :close, presence: true

  def day
    case self.day_of_week
      when 1
        return "Lundi"
      when 2
        return "Mardi"
      when 3
        return "Mercredi"
      when 4
        return "Jeudi"
      when 5
        return "Vendredi"
      when 6
        return "Samedi"
      when 0
        return "Dimanche"
      end
  end

  def closed?
    self.open == self.close
  end

  def order_day
    if self.day_of_week == 0
      return 7
    else
      return self.day_of_week
    end
  end
end

