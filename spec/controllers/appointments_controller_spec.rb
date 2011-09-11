require 'spec_helper'

describe AppointmentsController do
  
  include Devise::TestHelpers

  describe "POST /appointments" do
    
    before(:each) do
      @now = Time.now
    end
    
    context "with valid params" do
      it "should create a new appointment" do
      
        expect { 
          post :create, :appointment => {:inviter_id => 1, :invitee_id => 2, :date => Date.today, :hour => (@now + 5.hours).hour, 
          :minute => @now.min, :place_id => 1}
        }.to change{ 
          Appointment.count 
        }.by(1)
        
        expected_rendered_json = {
          :success => 1,
          :message => "Date has been added to your calendar"
        }.to_json
        
        response.body.should == expected_rendered_json
        
      end
    end
    
    context "with invalid params" do
      
      it "should not create a new appointment" do
        
        post :create
        
        expected_rendered_json = {
          :success => -1,
          :message => ["date is required", "hour is required", "minute is required", "place_id is required"]
        }.to_json
        
        response.body.should == expected_rendered_json
        
      end
      
    end
    
  end

end
