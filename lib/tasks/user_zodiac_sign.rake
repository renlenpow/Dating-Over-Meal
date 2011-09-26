task :user_zodiac_sign => :environment do
  Profile.all.each do |profile|
    unless profile.birth_year.blank? or profile.birth_month.blank? or profile.birth_day.blank?
      profile.update_attribute(:zodiac_sign, Time.local(profile.birth_year, profile.birth_month, profile.birth_day).zodiac_sign)
    end
  end
end