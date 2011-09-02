class ProfilesController < ApplicationController
  
  def show
    @user = User.find_by_username(params[:id])
    @profile = @user.profile
    @recent_activities = @user.recent_activities
    @recent_thoughts = @user.recent_thoughts
    @visited_places = current_user.visited_places
    @liked_places = current_user.liked_places
  end
  
  def edit
    @heights = []
    (4..6).each do |f|
      (0..11).each do |r|
        @heights << "#{f}' #{r}\""
      end
    end
    @heights << "Rather not say"
    @profile = Profile.find(params[:id])
  end
  
  def update
    @profile.update_attributes(params[:profile])
    render :json => {:success => 1}
  end
  
end
