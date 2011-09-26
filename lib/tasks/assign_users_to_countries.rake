task :assign_users_to_countries => :environment do
  Profile.all.each do |profile|
    place = Place.random
    
    profile.update_attributes(:city => place.city, :state => place.state, :country => place.country, :zipcode => place.zipcode)
  end
end