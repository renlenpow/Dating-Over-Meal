class Image < ActiveRecord::Base
  
  belongs_to :imageable, :polymorphic => true
  
  has_attached_file :picture, 
    :styles => { :large => "800x800>", :medium => "300x300>", :thumb => "100x100#" },
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
  
  def make_primary
    Image.update_all("is_primary = 0", :imageable_id => self.imageable_id)
    self.update_attributes(:is_primary => true)
  end
  
  def is_primary?
    self.is_primary
  end
  
end
