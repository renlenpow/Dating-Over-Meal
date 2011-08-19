class ProfilesController < ApplicationController
  
  before_filter :load_profile
  
  def show
    
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
