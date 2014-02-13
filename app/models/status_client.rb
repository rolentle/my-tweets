class StatusClient
  attr_reader :client
  def initialize(user)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['MY_TWEETS_CONSUMER_KEY']
      config.consumer_secret     = ENV['MY_TWEETS_CONSUMER_SECRET']
      config.access_token        = user.access_token
      config.access_token_secret = user.access_secret
    end
  end

  def get_statuses
  end
end
