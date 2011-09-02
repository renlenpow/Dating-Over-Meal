class DashboardController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @thought = Thought.new
    @messages = current_user.inbox_messages.active.not_read.most_recent.limit(3)
    @random_places = Place.random(8)
    @following = current_user.following.limit(5)
    @followers = current_user.followers.limit(5)
    @visited_places = current_user.visited_places
    @liked_places = current_user.liked_places
  end
  
end
