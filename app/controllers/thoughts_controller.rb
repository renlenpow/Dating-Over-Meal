class ThoughtsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def create
    thought = Thought.new params[:thought]
    thought.user_id = current_user.id
    if thought.save
      render :json => {:success => 1}
    else
      render :json => {:success => -1, :errors => thought.errors}
    end
    
  end
  
end
