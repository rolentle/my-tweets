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

  def pull_statuses
    batch_time = Time.now
    get_statuses.each do |status|
      write_status(status, batch_time)
    end
  end

  def get_statuses
    client.search("Justin Bieber")
  end

  def write_status(status, batch_time)
    status = user.statuses.find_or_create_by(text: status.full_text,
				    sent_at: status.created_at,
				    handle: status.user.handle)
    status.batch_time = batch_time unless status.bacth_time
    status.save
  end

  def self.pull_new_statuses
      self.new(User.first).pull_statuses
  end
end
