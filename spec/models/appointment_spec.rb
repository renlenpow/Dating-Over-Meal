require 'spec_helper'

describe Appointment do
  
  before(:each) do
    @place = Factory(:place)
    @inviter = Factory(:user, :username => :inviter, :email => "inviter@email.com")
    @invitee = Factory(:user, :username => :invitee, :email => "invitee@email.com")
  end
  
  it "should have a date, hour, minute, and place" do
    a = Appointment.new
    a.should_not be_valid
    
    a = Appointment.new(:inviter_id => @inviter.id, :invitee_id => @invitee.id, :date => Time.now, :hour => 11, :minute => 15, :place_id => @place.id)
    a.should be_valid
  end
  
  specify "most recent appointments should be listed in that order" do
    now = Time.now
    appointment_1 = Factory(:appointment, :inviter_id => @inviter.id, :invitee_id => @invitee.id, :date => now, :hour => now.hour, :minute => now.min, :place_id => @place.id)
    sleep(1)
    appointment_2 = Factory(:appointment, :inviter_id => @inviter.id, :invitee_id => @invitee.id, :date => now, :hour => now.hour + 2.hours, :minute => now.min, :place_id => @place.id)
    Appointment.most_recent.should == [appointment_2, appointment_1]
  end
  
  specify "chronologically ordered appointments should be listed by date/hour/minute" do
    now = Time.now
    appointment_1 = Factory(:appointment, :inviter_id => @inviter.id, :invitee_id => @invitee.id, :date => now, :hour => now.hour, :minute => now.min, :place_id => @place.id)
    sleep(1)
    appointment_2 = Factory(:appointment, :inviter_id => @inviter.id, :invitee_id => @invitee.id, :date => now, :hour => (now + 3.hours).hour, :minute => now.min, :place_id => @place.id)
    sleep(1)
    appointment_3 = Factory(:appointment, :inviter_id => @inviter.id, :invitee_id => @invitee.id, :date => now + 2.days, :hour => now.hour, :minute => now.min, :place_id => @place.id)
    Appointment.chronologically_ordered.should == [appointment_3, appointment_2, appointment_1]
  end
  
  it "should find place id by name before create" do
    now = Time.now
    
    place_1 = Factory(:place, :name => "The Cheesecake Factory")
    place_2 = Factory(:place, :name => "In and Out")
    place_3 = Factory(:place, :name => "Golden Coral")
    
    #appointment = Factory(:appointment, :inviter_id => @inviter.id, :invitee_id => @invitee.id, :date => now, :hour => now.hour, :minute => now.minute, :place_i)
  end
  
end
