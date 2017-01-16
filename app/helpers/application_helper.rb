module ApplicationHelper

  def format_date(date)
    date.strftime("%b %d, %Y")
  end

  def format_time(time)
    time.strftime("%-I:%M%P")
  end

  def bootstrap_class_for(flash_type)
    case flash_type
    when "success"
      "alert-success"   # Green
    when "error"
      "alert-danger"    # Red
    when "alert"
      "alert-warning"   # Yellow
    when "notice"
      "alert-info"      # Blue
    else
      flash_type.to_s
    end
  end

end
