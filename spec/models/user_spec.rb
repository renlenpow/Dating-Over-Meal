require 'spec_helper'

describe User do
  
  it "should always have email and password" do
    user = User.new
    user.should_not be_valid
    user = User.new(:email => "user@email.com", :password => "password")
    user.should be_valid
  end
  
end
