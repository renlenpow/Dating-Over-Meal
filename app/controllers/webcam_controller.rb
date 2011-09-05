class WebcamController < ApplicationController
  
  def capture
    File.open(upload_path, 'w') do |f|
        f.write request.raw_post.force_encoding("UTF-8")
    end
    render :text => "ok"
  end
  
  private

  def upload_path # is used in upload and create
    file_name = session[:session_id].to_s + '.jpg'
    File.join(Rails.root, 'public', 'uploads', file_name)
  end
  
end
