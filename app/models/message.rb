class Message < ActiveRecord::Base
  
  belongs_to :sender, :class_name => "User"
  belongs_to :receiver, :class_name => "User"
  
  validates_presence_of :content
  
  before_create :set_message_subject
  
  private
  
  def set_message_subject
    self.subject = "[no subject]" if self.subject.blank?
  end
  
end
