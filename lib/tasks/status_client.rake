namespace :status_client do
  desc "Pull down new tweets from twitter"
  task pull_new: :environment do
    StatusClient.pull_new_statuses(Time.now)
  end

end
