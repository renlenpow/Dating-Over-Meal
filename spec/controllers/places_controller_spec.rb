require 'spec_helper'

describe PlacesController do
  
  include Devise::TestHelpers

  describe "GET /index" do
    
    it "should respond successfully" do
      get :index
      response.should be_success
    end
    
  end
  
  describe "GET /place-name" do
    place = Factory(:place, :name => "The Cheesecake Factory")
    
    get :show, :id => "the-cheesecake-factory"
    response.should be_success
  end

end
