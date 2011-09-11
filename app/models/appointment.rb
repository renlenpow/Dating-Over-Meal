class Appointment < ActiveRecord::Base
  
  belongs_to :inviter, :class_name => "User"
  belongs_to :invitee, :class_name => "User"
  
  scope :most_recent, order("created_at DESC")
  scope :chronologically_ordered, order("date DESC, hour DESC, minute DESC")
  scope :by_inviter, lambda { |inviter_id| where(:inviter_id => inviter_id) }
  scope :by_invitee, lambda { |invitee_id| where(:invitee_id => invitee_id) }
  
  validates_presence_of :date, :hour, :minute, :place_id, :message => "is required"
  validate :appointment_time, :if => :should_validate_appointment_time?
  
  def appointment_time    
    closest_appointment = Appointment.by_inviter(inviter_id).chronologically_ordered.first
    
    difference = ((closest_appointment.hour * 100 + closest_appointment.minute) - (hour * 100 + minute)).abs / 100
    
    if difference < 1
      errors.add(:hour, "must be at least 1 hour apart")
      false
    end
  end
  
  def should_validate_appointment_time?
    if (date.blank? or hour.blank? or minute.blank?)
      false
    else
      same_day_appointments = Appointment.by_inviter(inviter_id).where("str_to_date(date, '%Y-%m-%d') = '#{self.date.strftime("%Y-%m-%d")}'")
    
      same_day_appointments.count > 0
    end
  end
  
end
