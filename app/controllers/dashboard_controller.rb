class DashboardController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @thought = Thought.new
    @messages = current_user.inbox_messages.active.not_read.most_recent.limit(3)
  end
  
end
