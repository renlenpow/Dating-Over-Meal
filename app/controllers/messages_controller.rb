class MessagesController < ApplicationController
  
  def create
    message = Message.new params[:message]
    
    if message.save
      render :json => {:success => 1}
    else
      render :json => {:success => -1, :errors => message.errors}
    end
  end
  
end
