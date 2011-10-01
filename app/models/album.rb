class Album < ActiveRecord::Base
  
  has_many :images
  
  validates_presence_of :title
  
end
