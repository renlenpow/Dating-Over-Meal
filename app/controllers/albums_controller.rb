class AlbumsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @albums = current_user.albums
  end
  
  def new
  end
  
end
