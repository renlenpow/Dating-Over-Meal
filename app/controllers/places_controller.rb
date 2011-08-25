class PlacesController < ApplicationController
  
  def new
    @place = Place.new
    @image = Image.new
    @cuisines = ["American", "Asian", "Chinese", "French"]
  end
  
  def create
    @place = Place.new params[:place]
    if @place.save
      flash[:notice] = "Your place has been shared"
      redirect_to dashboard_path
    else
      render :action => :new
    end
  end
  
end
