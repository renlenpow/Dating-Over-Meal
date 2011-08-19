class ProfilesController < ApplicationController
  
  before_filter :load_profile
  
  def show
    @user = @profile.user
    @recent_activities = @user.recent_activities
    @recent_thoughts = @user.recent_thoughts
  end
  
  def edit
  end
  
  def update
    @profile.update_attributes(params[:profile])
    render :json => {:success => 1}
  end
  
  private
  
  def load_profile
    @profile = Profile.find(params[:id])
  end
  
end
