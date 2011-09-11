require 'spec_helper'

describe UsersController do
  
  include Devise::TestHelpers
  render_views
  
  describe "GET /index" do
    
    before(:each) do
      @user = Factory(:user)
    end
    
    context "when viewing as a logged in user" do
      
      it "should respond successfully" do
        sign_in @user
        get :index
        response.should be_success
      end
    end
    
    context "when viewing anonymously" do
      
      it "should redirect to login page" do
        get :index
        response.should redirect_to(new_user_session_path)
      end
    end
    
  end
  
end
