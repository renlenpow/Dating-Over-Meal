require 'spec_helper'

describe AppointmentsController do
  
  include Devise::TestHelpers

  describe "POST /appointments" do
    
    before(:each) do
      @now = Time.now
      @place = Factory(:place)
    end
    
    context "with valid params" do
      # it "should create a new appointment" do
      #         inviter = Factory(:user, :username => :inviter, :email => "inviter@email.com")
      #         invitee = Factory(:user, :username => :invitee, :email => "invitee@email.com")
      #         expect { 
      #           post :create, :appointment => {:inviter_id => inviter.id, :invitee_id => invitee.id, :date => "2011-09-20", :hour => 12, :minute => 10, 
      #           :place_id => @place.name}
      #         }.to change{ 
      #           Appointment.count 
      #         }.by(1)
      #         
      #         expected_rendered_json = {
      #           :success => 1,
      #           :message => "Date has been added to your calendar"
      #         }.to_json
      #         
      #         response.body.should == expected_rendered_json
      #         
      #       end
    end
    
    context "with invalid params" do
      
      it "should not create a new appointment" do
        
        post :create
        
        expected_rendered_json = {
          :success => -1,
          :message => ["Date is required", "Place_id is required"]
        }.to_json
        
        puts response.body
        
        response.body.should == expected_rendered_json
        
      end
      
    end
    
  end

end
