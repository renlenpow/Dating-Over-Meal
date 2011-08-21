require 'spec_helper'

describe User do
  
  it "should always have first name, last name, email and password" do
    user = User.new
    user.should_not be_valid
    user = User.new(:email => "user@email.com", :password => "password")
    user.should_not be_valid
    user = User.new(:firstname => "First", :lastname => "Last", :email => "user@email.com", :password => "password")
    user.should be_valid
  end
  
  it "should have a unique email address" do
    first_user  = Factory(:user)
    second_user = User.new(:firstname => "First", :lastname => "Last", :email => "first.last@email.com", :password => "password")
    second_user.should_not be_valid
  end
  
  it "should have a profile after created" do
    user = User.new(:firstname => "First", :lastname => "Last", :email => "user@email.com", :password => "password")
    user.save!
  end
  
  it "should have an initial join activity" do
    user = User.new(:firstname => "First", :lastname => "Last", :email => "user@email.com", :password => "password")
    user.save!
    user.activities.size.should == 1
  end
  
  it "should have many activities" do
    u = User.reflect_on_association(:activities)
    u.macro.should == :has_many
  end
  
  it "should have many thoughts" do
    u = User.reflect_on_association(:thoughts)
    u.macro.should == :has_many
  end
  
  it "should only have access to messages sent to them" do
    sender    = Factory(:user, :firstname => 'John', :lastname => 'Doe', :email => 'john.doe@email.com')
    receiver  = Factory(:user, :firstname => 'John', :lastname => 'Smith', :email => 'john.smith@email.com')
    message   = Factory(:message, :sender_id => sender.id, :receiver_id => receiver.id)
    
    receiver.messages.active.should include(message)
  end
  
end
