class ProfilesController < ApplicationController
  
  def show
  end
  
  def edit
  end
  
  def update
    profile = Profile.find(params[:id])
    profile.update_attributes(params[:profile])
    render :nothing => true
  end
  
end
