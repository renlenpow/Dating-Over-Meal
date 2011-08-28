class Place < ActiveRecord::Base
  
  belongs_to :sharer, :class_name => "User", :foreign_key => :sharer_id
  has_and_belongs_to_many :cuisines
  has_and_belongs_to_many :moods
  has_many :images, :as => :imageable, :dependent => :destroy
  
  accepts_nested_attributes_for :images
  
  validates_presence_of :name, :description, :street_address, :city
  
  extend FriendlyId
  friendly_id :name, :use => :slugged
    
  def primary_image
    if self.images.size == 0
      nil
    else
      all_images = self.images
      primary_image = all_images.where(:is_primary => true).first
      all_images.first.picture.url(:thumb) if primary_image.nil?
      primary_image.picture.url(:thumb)
    end
  end
  
end
