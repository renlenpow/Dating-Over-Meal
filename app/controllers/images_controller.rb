class ImagesController < ApplicationController
  
  before_filter :load_image
  
  def update
    begin
      @image = Image.find(params[:id])
      if @image.update_attributes(params[:image])
        render :json => {:success => 1}
      else
        render :json => {:success => -1}
      end
    rescue
      render :json => {:success => -2}
    end
  end
  
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
