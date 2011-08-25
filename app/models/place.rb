class Place < ActiveRecord::Base
  
  belongs_to :sharer, :class_name => "User", :foreign_key => :sharer_id
  has_and_belongs_to_many :cuisines
  has_and_belongs_to_many :moods
  has_many :images, :as => :imageable, :dependent => :destroy
  
  accepts_nested_attributes_for :images
  
  validates_presence_of :name, :description, :street_address, :city
  
  extend FriendlyId
  friendly_id :name, :use => :slugged
  
  acts_as_gmappable
  
  def gmaps4rails_address
  end
  
end
