OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter, ENV['MY_TWEETS_TWITTER_KEY'], ENV['MY_TWEETS_TWITTER_SECRET']
end

