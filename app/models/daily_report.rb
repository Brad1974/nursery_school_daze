class DailyReport < ApplicationRecord
  belongs_to :child

  def nap_duration
    # distance_of_time_in_words(nap_end - nap_start)
    Time.at(nap_end - nap_start).utc.strftime("%-H:%M") #=> "01:00:00"
  end

end
