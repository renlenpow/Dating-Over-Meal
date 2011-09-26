require 'spec_helper'

describe AppointmentsController do
  
  include Devise::TestHelpers
  
  describe "POST /appointments" do
    
    before(:each) do
      @now = Time.now
      @place = Factory(:place)
    end
    
    #TODO: figure out why the fuck this test fails
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
    
    # context "with invalid params" do
    #       
    #       it "should not create a new appointment" do
    #         
    #         post :create, :appointment => {}
    #         
    #         expected_rendered_json = {
    #           :success => -1,
    #           :message => ["Date is required", "Place_id is required"]
    #         }.to_json
    #         
    #         puts response.message
    #         
    #         response.body.should == expected_rendered_json
    #         
    #       end
    #       
    #     end
    
  end


  describe "PUT /appointments/:id" do
      
    before(:each) do
      @inviter = Factory(:user, :username => :inviter, :email => "inviter@email.com")
      @invitee = Factory(:user, :username => :invitee, :email => "invitee@email.com")
      sign_in(@inviter)
      @place_1 = Factory(:place, :name => "Place 1")
      @place_2 = Factory(:place, :name => "Place 2")
    end
      
    it "should update the appointment if the appointment's date has not passed" do
      
      appointment = Factory(:appointment, :inviter_id => @inviter.id, :invitee_id => @invitee.id, :date => Time.now + 5.days, 
      :place_id => @place_1.id, :note => "Initial note")
      
      put :update, :id => appointment.id, :appointment => {:note => "Updated note", :place_id => @place_2.id}
      
      response.should redirect_to edit_appointment_url
      appointment.reload
      appointment.place_id.should == @place_2.id
      appointment.note.should == "Updated note"
      
    end
    
    it "should not update the appointment once the appointment's date has passed" do
      appointment = Appointment.new(:inviter_id => @inviter.id, :invitee_id => @invitee.id, :date => Time.now - 5.days, 
      :place_id => @place_1.id, :note => "Initial note")
      appointment.save!(:validate => false)
      
      put :update, :id => appointment.id, :appointment => {:note => "Updated note", :place_id => @place_2.id}
      
      response.should redirect_to dashboard_url
    end
    
  end

end
