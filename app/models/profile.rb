class Profile < ActiveRecord::Base
  
  belongs_to :user
  
  # Used on the users listing (index) page
  def brief
    b = []
    
    age = calculate_age
    
    b << age unless age.nil?
    
    b << self.gender unless self.gender.nil?
    
    b << self.zodiac unless self.zodiac.nil?
    
    b.join(" - ")
  end
  
  def calculate_age
    if self.birth_year.blank? or self.birth_month.blank? or self.birth_day.blank?
      nil
    else
      now = Time.now
      age = now.year - self.birth_year
      age -= 1 if Time.mktime(now.year, self.birth_month, self.birth_day) > Time.mktime(now.year, now.month, now.day)
      age
    end
  end
  
end
