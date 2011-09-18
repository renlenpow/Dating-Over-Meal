class HomeController < ApplicationController
  
  def index
    @places = Place.random(9)
    @users = User.random(14)
  end
  
end
