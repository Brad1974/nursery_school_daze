class DailyReport < ApplicationRecord
  belongs_to :child

  def nap_duration
    if nap_start && nap_end
      Time.at(nap_end - nap_start).utc.strftime("%-H:%M")
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
