class Message < ActiveRecord::Base
  
  belongs_to :sender, :class_name => "User"
  belongs_to :receiver, :class_name => "User"
  
  validates_presence_of :content
  
  before_create :set_message_subject
  
  scope :active, where(:spam => false, :archived => false)
  scope :not_read, where(:read => false)
  scope :most_recent, order("created_at DESC")
  
  private
  
  def set_message_subject
    self.subject = "[no subject]" if self.subject.blank?
  end
  
end
