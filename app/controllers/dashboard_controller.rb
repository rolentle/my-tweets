class DashboardController < ApplicationController
  def show
    @statuses = Status.order('sent_at DESC').limit(100)
  end
end
