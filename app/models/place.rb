class Place < ActiveRecord::Base
  
  belongs_to :sharer, :class_name => "User", :foreign_key => :sharer_id
  has_and_belongs_to_many :cuisines
  has_and_belongs_to_many :moods
  has_many :images, :as => :imageable, :dependent => :destroy
  has_many :interactions, :dependent => :destroy
  
  scope :most_recent, order("created_at DESC")
  
  accepts_nested_attributes_for :images
  
  validates_presence_of :name, :description, :street_address, :city
  
  extend FriendlyId
  friendly_id :name, :use => :slugged
  
  ajaxful_rateable :stars => 5
    
  def primary_image
    images = self.images
    if images.length == 0
      nil
    else
      # all_images = self.images
      #       primary_image = all_images.where(:is_primary => true).first
      #       return all_images.first.picture.url if primary_image.nil?
      #       primary_image.picture.url
      images.first.picture.url
    end
  end
  
  def self.search_place(hash)
    if hash[:name].present?
      conditions = {}
      conditions[:street_address] = hash[:street_address] if hash[:street_address].present?
      conditions[:city] = hash[:city] if hash[:city].present?
      conditions[:state] = hash[:state] if hash[:state].present?
      conditions[:zipcode] = hash[:zipcode] if hash[:zipcode].present?
      self.search hash[:name], :conditions => conditions
    else
      self.all
    end
  end
  
  # Sphinx searching
  define_index do
    indexes :name, :sortable => true
    indexes street_address
    indexes city
    indexes zipcode
  end
  
  def count_visits
    self.interactions.where(:kind => :visit).size
  end
  
  def count_likes
    self.interactions.where(:kind => :like).size
  end
  
end
