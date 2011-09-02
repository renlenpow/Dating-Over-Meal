class PlacesController < ApplicationController
  
  before_filter :load_place, :only => [:edit, :update, :show, :destroy, :rate, :visit, :like]
  before_filter :load_page, :only => [:index]
  
  def index
    if params[:name].present? and !params[:name].blank?
      @places = Place.search_place(:name => params[:name], :city => params[:city], :state => params[:state], :zipcode => params[:zipcode])
    else
      @places = Place.most_recent.paginate(:page => @page, :per_page => 25)
    end
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
  
  def rate
    @place.rate(params[:stars], current_user)
    average = @place.rate_average(true)
    width = (average / @place.class.max_stars.to_f) * 100
    render :json => {:id => @place.wrapper_dom_id(params), :average => average, :width => width}
  end
  
  def like
    if current_user.like_place(@place)
      render :json => {:success => 1, :message => "Thank you for liking #{@place.name}"}
    else
      render :json => {:success => -1, :message => "You have already liked this place"}
    end
  end
  
  def visit
    if current_user.has_visited_place(@place)
      render :json => {:success => 1, :message => "Thank you for visiting #{@place.name}"}
    else
      render :json => {:success => -1, :message => "You have already visited this place"}
    end
  end
  
  private
  
  def load_place
    @place = Place.find params[:id]
  end
  
end
