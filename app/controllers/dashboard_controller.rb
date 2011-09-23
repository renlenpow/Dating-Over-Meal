class DashboardController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @thought = Thought.new
    @messages = current_user.inbox_messages.active.not_read.most_recent.limit(3)
    @random_places = Place.includes(:images, :interactions).random(8)
    @following = current_user.following.limit(5)
    @followers = current_user.followers.limit(5)
    @visited_places = current_user.visited_places.includes(:images)
    @liked_places = current_user.liked_places.includes(:images)
    @proposed_appointments = current_user.proposed_appointments
  end
  
end
