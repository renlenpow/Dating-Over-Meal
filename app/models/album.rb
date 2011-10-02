class Album < ActiveRecord::Base
  
  has_many :images, :as => :imageable, :dependent => :destroy
  
  validates_presence_of :title
  
end
