class AppointmentsController < ApplicationController
  
  def create
    @appointment = Appointment.new params[:appointment]
    
    if @appointment.save
      render :json => {:success => 1, :message => "Date has been added to your calendar"}
    else
      render :json => {:success => -1, :message => @appointment.errors.flatten_to_string }
    end
  end
  
end
