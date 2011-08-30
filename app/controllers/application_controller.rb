class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :load_user_profile
  
  helper_method :singular_class_name
  
  protected
  
  def load_user_profile
    if user_signed_in?
      @profile = current_user.profile
    end
  end
  
  def load_page
    @page = params[:page] ? params[:page].to_i : 1
  end
  
end
