class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :load_user, :only => [:edit, :update]
  
  def index
    @users = User.paginate(:page => @page, :per_page => 100)
  end
  
  def follow
    begin
      user_followed = User.find(params[:followed_id])
      unless current_user.following?(user_followed)
        current_user.follow!(user_followed)
        render :json => {:success => 1}
      end
    rescue
      render :json => {:success => -1}
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Avatar has been uploaded"
      redirect_to :action => :edit
    else
      render :action => :edit
    end
  end
  
  private
  
  def load_user
    @user = User.find params[:id]
  end
  
end
