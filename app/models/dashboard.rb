class Dashboard
  def last_24_hours_batch_times
    Status.pluck(:batch_time).uniq.select do |time|
      time > (DateTime.now - 86400)
    end.sort
  end

  def last_24_hours_batch_sizes
    Time.zone = 'Eastern Time (US & Canada)'
    last_24_hours_batch_times.map do |time|
      [time, Status.where(batch_time: time).count]
    end
  end

end
