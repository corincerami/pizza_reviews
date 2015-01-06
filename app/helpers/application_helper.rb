module ApplicationHelper
  def format_datetime(datetime)
    datetime.strftime("%B %d, %Y - %H:%M")
  end
end
