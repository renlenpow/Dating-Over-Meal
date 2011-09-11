class ThoughtsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def create
    thought = Thought.new params[:thought]
    thought.user_id = current_user.id
    if thought.save
      render :json => {:success => 1, :message => "Your thought has been shared"}
    else
      render :json => {:success => -1, :message => thought.errors.flatten_to_string }
    end
    
  end
  
end
