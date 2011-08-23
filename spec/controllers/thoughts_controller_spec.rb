require 'spec_helper'

describe ThoughtsController do
  
  include Devise::TestHelpers

  def do_create
    post :create, :thought => {:description => "sample thought"}
  end
  
  it "should be success" do
    user = Factory(:user)
    
    sign_in user
    do_create
    response.should be_success
  end
  
end
