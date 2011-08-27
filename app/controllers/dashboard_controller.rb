class DashboardController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @thought = Thought.new
    @messages = current_user.inbox_messages.active.not_read.most_recent.limit(3)
    @places = current_user.places
    @following = current_user.following.limit(5)
    @followers = current_user.followers.limit(5)
  end
  
end
