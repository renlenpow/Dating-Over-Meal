class HomeController < ApplicationController
  
  def index
    @places = Place.includes(:images).random(9)
    @users = User.random(14)
  end
  
end
