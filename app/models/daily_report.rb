class DailyReport < ApplicationRecord
  belongs_to :child

  before_create :set_nap

  def set_nap
    self.nap_start = Time.now
    self.nap_end = Time.now
  end

  def nap_duration
    binding.pry
    if nap_start && nap_end && (nap_end.to_i != nap_start.to_i)
      hour = Time.at(nap_end - nap_start).utc.strftime("%-H")
      minute = Time.at(nap_end - nap_start).utc.strftime("%M")
      time = Time.at(nap_end - nap_start).utc.strftime("%-H:%M")
      if hour.to_i > 1
        return "Your child slept #{hour} hours and #{minute} minutes"
      elsif hour.to_i == 1
        return "Your child slept #{hour} hour and #{minute} minutes"
      elsif hour.to_i == 0
        return "Your child slept #{minute} minutes"
      end
    end
  end

  def needs
    needs_array = []
    needs_array << self.clothing_needed if !self.clothing_needed.empty?
    needs_array << self.other_needed if !self.other_needed.empty?
    needs_array << "diapers" if self.need_diapers
    return needs_array
  end

end
