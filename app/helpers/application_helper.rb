module ApplicationHelper
  
  def format_date(date)
    date.strftime("%b %d, %Y")
  end

  def format_time(time)
    time.strftime("%-I:%M%P")
  end

end
