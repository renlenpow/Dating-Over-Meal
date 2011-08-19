class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  
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
  
end
