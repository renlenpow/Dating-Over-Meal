require 'spec_helper'

describe User do
  
  it "should always have first name, last name, username, email and password" do
    user = User.new
    user.should_not be_valid
    user = User.new(:email => "user@email.com", :password => "password")
    user.should_not be_valid
    user = Factory(:user)
    user.should be_valid
  end
  
  it "should have a unique email address" do
    first_user  = Factory(:user)
    second_user = User.new(:firstname => "First", :lastname => "Last", :username => "abcd123", :email => "first.last@email.com", :password => "password", 
    :birth_day => 30, :birth_month => "May", :birth_year => 1984)
    second_user.should_not be_valid
  end
  
  it "should have a username consisted of only letters, numbers, and underscores" do
    user = User.new(:firstname => "First", :lastname => "Last", :username => "first.last", :email => "first.last@email.com", :password => "password",
    :birth_day => 30, :birth_month => "May", :birth_year => 1984)
    user.should_not be_valid
    
    user.username = "first_last"
    user.should be_valid
  end
  
  it "should have a unique username" do
    first_user = Factory(:user)
    second_user = User.new(:firstname => "First", :lastname => "Last", :username => "username", :email => "first.last111@email.com", :password => "password")
    second_user.should_not be_valid
  end
  
  it "should have a profile after created" do
    user = Factory(:user)
    user.save!
    user.profile.should_not be_nil
    profile = user.profile
    profile.firstname.should == user.firstname
    profile.lastname.should == user.lastname
  end
  
  it "should have an initial join activity" do
    user = Factory(:user)
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
    sender    = Factory(:user, :username => "john_doe", :firstname => 'John', :lastname => 'Doe', :email => 'john.doe@email.com')
    receiver  = Factory(:user, :username => "john_smith",  :firstname => 'John', :lastname => 'Smith', :email => 'john.smith@email.com')
    message   = Factory(:message, :sender_id => sender.id, :receiver_id => receiver.id)
    
    receiver.messages.active.should include(message)
  end
  
  it "should have many interactions" do
    u = User.reflect_on_association(:interactions)
    u.macro.should == :has_many
  end
  
  it "should have like_place and like_place? methods" do
    user = Factory(:user)
    user.should respond_to(:like_place)
    user.should respond_to(:like_place?)
  end
  
  it "should have has_visited_place and has_visited_place? methods" do
    user = Factory(:user)
    user.should respond_to(:has_visited_place)
    user.should respond_to(:has_visited_place?)
  end
  
  it "should include visited places if applicable" do
    user = Factory(:user)
    
    place_1 = Factory(:place)
    place_2 = Factory(:place)
    place_3 = Factory(:place)
    
    user.has_visited_place(place_1)
    user.visited_places.should include(place_1)
  end
  
  it "should not be able visit a place more than once" do
    user = Factory(:user)
    
    place_1 = Factory(:place)
    
    user.has_visited_place(place_1).should == true
    user.has_visited_place(place_1).should == false
  end
  
  it "should indicate whether they have visited a place properly" do
    user = Factory(:user)
    
    place_1 = Factory(:place)
    place_2 = Factory(:place)
    place_3 = Factory(:place)
    
    user.has_visited_place(place_1)
    user.has_visited_place?(place_1).should == true
    user.has_visited_place?(place_2).should == false
    user.has_visited_place?(place_3).should == false
    
    user.has_visited_place(place_2)
    user.has_visited_place?(place_2).should == true
  end
  
  it "should include liked places if applicable" do
    user = Factory(:user)
    
    place_1 = Factory(:place)
    place_2 = Factory(:place)
    place_3 = Factory(:place)
    
    user.like_place(place_1)
    user.liked_places.should include(place_1)
  end
  
  it "should not be able to like a place more than once" do
    user = Factory(:user)
    
    place_1 = Factory(:place)
    place_2 = Factory(:place)
    
    user.like_place(place_1).should == true
    user.like_place(place_1).should == false
    user.like_place(place_2).should == true
    user.like_place(place_2).should == false
  end
  
end
