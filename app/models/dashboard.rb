class Dashboard
  def last_24_hours_batch_times
    Status.pluck(:batch_time).uniq.select do |time|
      time > (DateTime.now - 86400)
    end.sort
  end

  def last_24_hours_batch_sizes
  #@l24hrsbz ||=  last_24_hours_batch_times.map do |time|
  #    [time, Status.where(batch_time: time).count]
  # end
    @batch_time||= Status.group(:batch_time).count
  end

  def last_24_hours_tweet_times_in_5mins
    sent_ats = Status.pluck(:sent_at).uniq.select do |time|
      time > (DateTime.now - 86400)
    end.sort

    sent_ats.map do |time|
      time = time - time.sec
    end.uniq
  end

  def last_24_hours_tweets_per_5min
    #@l24hrs_5min ||= last_24_hours_tweet_times_in_5mins.map do |time|
    #  [time, Status.where("sent_at >= :start_time AND sent_at < :end_time",
    #			  {start_time: time,
    #                       end_time: time + 60}).count]
    #end
    @tweet_time||= Status.group(:sent_at).order(:sent_at).count
  end
end
