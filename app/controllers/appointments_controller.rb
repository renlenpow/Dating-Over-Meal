class AppointmentsController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :find_appointment, :only => [:edit, :update, :show, :destroy, :report_abuse]
  before_filter :get_place, :only => [:edit]
  before_filter :can_update_appointment?, :only => [:edit, :update, :delete]
  
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
  
  def edit
  end
  
  def update
    if @appointment.update_attributes(params[:appointment])
      flash[:notice] = "Appointment has been updated"
      redirect_to :action => :edit
    else
      get_place
      render :action => :edit
    end
  end
  
  def show
  end
  
  def destroy
    @appointment.destroy
    flash[:notice] = "Appointment has been cancelled"
    redirect_to dashboard_url
  end
  
  def report_abuse
    @appointment.abuse_reports << AbuseReport.create(:note => params[:note])
    render :json => {:success => 1, :message => "Thank you for reporting"}
  end
  
  private
  
  def find_appointment
    @appointment = Appointment.find(params[:id])
  end
  
  def get_place
    @place = Place.find(:first, :conditions => {:id => @appointment.place_id})
  end
  
  def can_update_appointment?
    if @appointment.date < Time.now
      flash[:error] = "The date has already happened"
      redirect_to dashboard_url and return 
    end
    if @appointment.inviter_id != current_user.id
      flash[:error] = "You cannot change that appointment"
      redirect_to dashboard_url and return 
    end
  end
  
end
