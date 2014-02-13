OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter, ENV['MY_TWEETS_CONSUMER_KEY'], ENV['MY_TWEETS_CONSUMER_SECRET']
end

