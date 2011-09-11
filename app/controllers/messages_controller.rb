class MessagesController < ApplicationController
  
  def index
    @messages = current_user.inbox_messages.active.most_recent.paginate(:page => 1, :per_page => 5)
  end
  
  def create
    message = Message.new params[:message]
    
    if message.save
      render :json => {:success => 1, :message => "Your message has been sent"}
    else
      render :json => {:success => -1, :message => message.errors.flatten_to_string}
    end
  end
  
  def show
    @head_message = Message.find params[:id]
    @child_messages = @head_message.child_messages
    @messages = @child_messages.insert(0, @head_message)
    @message = Message.new
  end
  
end
