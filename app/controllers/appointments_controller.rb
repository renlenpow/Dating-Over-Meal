class AppointmentsController < ApplicationController
  
  def index
    respond_to do |format|
      format.json do
        render :json => Appointment.where("inviter_id = #{current_user.id} OR invitee_id = #{current_user.id}").all.to_json
      end
    end
    
  end
  
  def create
    @appointment = Appointment.new params[:appointment]
    
    if @appointment.save
      render :json => {:success => 1, :message => "Date has been added to your calendar"}
    else
      render :json => {:success => -1, :message => @appointment.errors.flatten_to_string }
    end
  end
  
end
