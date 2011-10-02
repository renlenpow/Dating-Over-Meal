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
  
  describe "POST /albums" do
    
    before(:each) do
      @user = Factory(:user)
      sign_in(@user)
    end
    
    it "should create an album with valid params" do
      expect {
        post :create, :album => {:title => "My album"}
      }.to change {
        Album.count
      }.by(1)
      
      @user.albums.count.should == 1
      
      response.should redirect_to albums_path
      
    end
    
    it "should not create an album with invalid params" do
      
      post :create
      
      response.should render_template(:new)
      
    end
    
  end
  
  describe "GET /albums/:id/edit" do
    
    context "when user is not logged in" do
      
      it "should redirect to login page" do
        get :edit, :id => 1
        response.should redirect_to new_user_session_path
      end
      
    end
    
    context "when user is logged in" do
      
      it "should render the page properly" do
        user = Factory(:user)
        sign_in(user)
        
        album = Factory(:album, :user_id => user.id)
        
        get :edit, :id => album.id
        
        response.should be_success
        response.should_not redirect_to new_user_session_path
        
      end
      
      specify "user should only have access to their own albums" do
        
        user_1 = Factory(:user, :username => "user1", :email => "user1@email.com")
        user_2 = Factory(:user, :username => "user2", :email => "user2@email.com")
        
        album_1 = Factory(:album, :user_id => user_1.id)
        album_2 = Factory(:album, :user_id => user_2.id)
        
        sign_in(user_2)
        
        get :edit, :id => album_1.id
        response.should redirect_to albums_path
        
      end
      
    end
    
  end
  
  describe "GET /albums/:id" do
    it "should render the albums with pictures if applicable" do
      user = Factory(:user)
      album = Factory(:album)
      image = Factory(:image)
      album.images << image
      album.save
      empty_album = Factory(:album)
      
      get :show, :id => album.id
      
      response.should be_success
      assigns(:album).should == album
    end
  end
  
  describe "POST /albums/:id" do
    #TBI
  end
  
  describe "DELETE /albums/:id" do
    it "should delete the albums and its corresponding images" do
      user = Factory(:user)
      album = Factory(:album)
      image = Factory(:image)
      album.images << image
      album.save
      
      expect {
        delete :destroy, :id => album.id
      }.to change{
        Album.count
      }.by(-1)
      
      response.should redirect_to albums_path
      Image.where(:id => image.id).should be_nil
      
    end
  end

end
