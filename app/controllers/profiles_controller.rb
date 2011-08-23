class ProfilesController < ApplicationController
  
  def show
    @user = User.find_by_username(params[:id])
    @profile = @user.profile
    @recent_activities = @user.recent_activities
    @recent_thoughts = @user.recent_thoughts
  end
  
  def edit
    @profile = Profile.find(params[:id])
  end
  
  def update
    @profile.update_attributes(params[:profile])
    render :json => {:success => 1}
  end
  
end
