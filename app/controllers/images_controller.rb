class ImagesController < ApplicationController
  
  before_filter :load_image
  
  def destroy
    render :nothing => true
  end
  
  def make_primary
    @image.make_primary
    render :json => {:success => 1}
  end
  
  private 
  
  def load_image
    @image = Image.find params[:id]
  end
  
end
