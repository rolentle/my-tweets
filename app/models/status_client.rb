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
    get_statuses.each do |status|
      write_status(status)
    end
  end

  def get_statuses
    client.user_timeline(client.user.id, count:200)
  end

  def write_status(status)
    user.statuses.find_or_create_by(text: status.full_text,
				    sent_at: status.created_at)
  end

  def self.pull_new_statuses
    User.all.each  { |user| self.new(user).pull_statuses }
  end
end
