require 'spec_helper'

describe StatusClient do
  it "should have a can grab tweets for a user", :vcr do
    auth = OmniAuth.config.mock_auth[:twitter]
    user = User.from_omniauth(auth)
    status_client = StatusClient.new(user)

    expect(status_client.client).not_to be_nil

    status_client.get_statuses
    expect(user.statuses.count).to eq 200
  end
end
