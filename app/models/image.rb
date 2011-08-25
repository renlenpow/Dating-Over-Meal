class Image < ActiveRecord::Base
  
  belongs_to :imageable, :polymorphic => true
  
  has_attached_file :picture, 
    :styles => { :medium => "300x300>", :thumb => "100x100#" },
    :storage => :aws,
    :s3_credentials => {
      :access_key_id => 'AKIAIGHKJHBKXPQHPWIQ',
      :secret_access_key => '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'
    },
    :s3_acl => :public_read,
    :s3_protocol => 'http',
    :s3_bucket => :dom305,
    :path => "images/:id/:style/:filename"
    
  validates_attachment_content_type :picture, :content_type => ["image/png", "image/jpeg", "image/gif"]
  
end
