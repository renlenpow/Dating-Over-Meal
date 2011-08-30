class PlacesController < ApplicationController
  
  before_filter :load_place, :only => [:edit, :update, :show, :destroy]
  before_filter :load_page, :only => [:index]
  
  def index
    @places = Place.paginate(:page => @page, :per_page => 25)
  end
  
  def new
    @place = Place.new
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
  
  def edit
  end
  
  def update
    if @place.update_attributes(params[:place])
      flash[:notice] = "Place has been updated"
      redirect_to :action => :edit
    else
      render :action => :edit
    end
  end
  
  def destroy
  end
  
  def show
  end
  
  private
  
  def load_place
    @place = Place.find params[:id]
  end
  
end
