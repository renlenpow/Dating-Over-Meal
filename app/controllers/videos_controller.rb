class VideosController < ApplicationController
  
  def index
  end
  
  def new
    @video = Video.new
  end
  
  def create
    @video = Video.new(params[:video])
    
    if @video.save
      flash[:notice] = "Your video has been added"
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
end
