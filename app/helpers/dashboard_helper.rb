module DashboardHelper
  def date_formater(date)
    hour = date.hour.to_s
    min = date.min > 10 ? date.min.to_s : "0" + date.min.to_s
    "#{hour}:#{min}" 
  end
end
