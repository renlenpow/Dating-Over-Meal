require 'spec_helper'

describe ProfilesController do
  
  include Devise::TestHelpers
  render_views
  
  describe "GET /username" do
    
    context "testing profile page" do
      before(:each) do
        @user = Factory(:user, :username => :username)
      end
    
      it "should respond successfully with a valid profile" do
        get :show, :id => :username
        response.should be_success
      end
    
      it "should redirect to error page with an non-existing profile" do
        get :show, :id => :abc123
        flash[:error].should == "The profile you're looking for does not exist"
        response.should redirect_to(error_path)
      end
    end
    
    context "testing message and follow" do
      before(:each) do
        @viewing_user = Factory(:user, :username => :viewing, :email => "viewing@email.com")
        @viewed_user = Factory(:user, :username => :viewed, :email => "viewed@email.com") 
      end
      
      context "when the viewing user is logged in" do
        before(:each) do
          sign_in @viewing_user
        end

        it "should show the 'Follow user' and 'Message this user' button if applicable" do
          get :show, :id => :viewed

          response.should contain("Message this user")
          response.should contain("Follow this user")
        end

        it "should not show the 'Follow user' and 'Message this user' if viewing own's profile" do
          get :show, :id => :viewing

          response.should_not contain("Message this user")
          response.should_not contain("Follow this user")
        end
      end
    end
    
    context "when the viewing user is anonymous" do
      before(:each) do
        @user = Factory(:user, :username => :apollo)
      end
      
      it "should not show the 'Follow user' and 'Message this user' button" do
        get :show, :id => :apollo
        response.should_not contain("Message this user")
        response.should_not contain("Follow this user")
      end
    end
    
  end
  
  describe "PUT /id" do
    
    # it "should update the profile properly" do
    #       profile = mock_model(Profile)
    #       #profile.stub!(:update_attributes).and_return(true)
    #       put :update, :id => 1, :profile => {}
    #       response.should be_success
    #     end
    
  end
  
end
