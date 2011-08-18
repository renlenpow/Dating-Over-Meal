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
  
  it "should have a profile after created" do
    user = User.new(:firstname => "First", :lastname => "Last", :email => "user@email.com", :password => "password")
    user.save!
  end
  
end
