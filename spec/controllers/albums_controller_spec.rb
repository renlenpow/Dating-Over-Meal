require 'spec_helper'

describe AlbumsController do
  
  include Devise::TestHelpers
  
  describe "GET /albums" do
    
    it "should show only the albums that belong to a user and none if applicable" do
      
      user_1 = Factory(:user, :username => "user_1", :email => "user_1@email.com")
      user_2 = Factory(:user, :username => "user_2", :email => "user_2@email.com")
      sign_in(user_1)
      
      album_1 = Factory(:album, :user_id => user_1.id)
      album_2 = Factory(:album, :user_id => user_1.id)
      album_3 = Factory(:album, :user_id => user_2.id)
      
      get :index
      assigns(:albums).should == [album_1, album_2]
      
    end
    
  end

  describe "GET /albums/new" do
    
    it "should render the page" do
      user = Factory(:user)
      sign_in(user)
      get :new
      response.should be_success
    end    
    
  end

end
