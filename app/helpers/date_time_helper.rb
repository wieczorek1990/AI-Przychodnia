module DateTimeHelper
  def format_days(day)
    Date::DAYNAMES[day]
  end
  
  def format_hours(date)
    date.to_formatted_s(:time)
  end
  
  def format_date(date)
    date.to_formatted_s(:db)
  end
  
  def daynames
    Date::DAYNAMES.zip((0..6).to_a)
  end
end
