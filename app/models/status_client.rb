class StatusClient
  attr_reader :client, :user
  def initialize(user)
    @user = user
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['MY_TWEETS_CONSUMER_KEY']
      config.consumer_secret     = ENV['MY_TWEETS_CONSUMER_SECRET']
      config.access_token        = user.access_token
      config.access_token_secret = user.access_secret
    end
  end

  def pull_statuses(batch_time)
    puts "starting pull @ #{batch_time}"
    old_status = Status.count

    get_statuses.each do |status|
      write_status(status, batch_time)
    end
    end_time = Time.now
    puts "added #{Status.count - old_status} tweets @ #{Time.now}"
    puts "ended took #{end_time - batch_time} to run"
  end

  def get_statuses
    client.search("Justin Bieber")
  end

  def write_status(status, batch_time)
    status_time = status.created_at - status.created_at.sec
    new_status = user.statuses.find_or_create_by(text: status.full_text,
				    sent_at: status_time,
				    handle: status.user.handle)
    new_status.batch_time ||= batch_time
    new_status.save
  end

  def self.pull_new_statuses(batch_time)
      self.new(User.first).pull_statuses(batch_time)
  end
end
