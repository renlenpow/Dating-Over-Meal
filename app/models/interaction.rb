class Interaction < ActiveRecord::Base
  
  validates_presence_of :user_id, :place_id
  validates_uniqueness_of :user_id, :scope => [:place_id, :kind]
  
end
