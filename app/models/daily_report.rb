class DailyReport < ApplicationRecord
  belongs_to :child
  has_many :kind_acts
  accepts_nested_attributes_for :kind_acts, reject_if: :all_blank, allow_destroy: true

  validates :narrative, presence: { message: "You must enter a narrative" }
  validate :not_future_date
  validate :unique_date, on: :create
  validate :consistent_time

  def consistent_time
    if (no_nap_today == false) && ( (nap_end <= nap_start) || (nap_start == "Sat, 01 Jan 2000 03:00:00 UTC +00:00" || nap_end == "Sat, 01 Jan 2000 03:00:00 UTC +00:00"))
      errors.add(:nap_start, "Your nap start and end times are invalid")
      errors.add(:nap_end, "")
    end
  end

  def not_future_date
    if date > Date.today
      errors.add(:date, "You can't write a report for a future date")
    end
  end

  def unique_date
    if self.child.daily_reports.find {|d| d.date == date && d.id != nil}
      errors.add(:date, "Looks like you already submitted a report for this date.")
    end
  end

  def nap_statement
    if nap_end.to_i != nap_start.to_i
      hour = Time.at(nap_end - nap_start).utc.strftime("%-H")
      minute = Time.at(nap_end - nap_start).utc.strftime("%-M")
      if hour.to_i > 1
        return "Your child slept #{hour} hours and #{minute} minutes"
      elsif hour.to_i == 1
        return "Your child slept #{hour} hour and #{minute} minutes"
      elsif hour.to_i == 0
        return "Your child slept #{minute} minutes"
      end
    end
  end

  def narrative_array
    binding.pry
    return [narrative, narrative1, narrative2, narrative3, narrative4].select{|n| !n.empty?}
  end

  def needs
    needs_array = []
    needs_array << self.clothing_needed if !self.clothing_needed.empty?
    needs_array << self.other_needed if !self.other_needed.empty?
    needs_array << "diapers" if self.need_diapers
    return needs_array
  end

  def nap_duration
    if nap_end.to_i != nap_start.to_i
      start = Time.at(nap_start)
      ending = Time.at(nap_end)
      return (ending - start)/3600
    else
      return 0
    end
  end

end
