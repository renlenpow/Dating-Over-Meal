class DashboardController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @thought = Thought.new
  end
  
end
