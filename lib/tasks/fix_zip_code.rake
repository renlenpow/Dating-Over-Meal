task :fix_zipcode => :environment do
  Place.where(:country => "CA").each do |place|
    if place.zipcode.size > 7
      place.zipcode = place.zipcode[0,7]
      place.save
    end
  end
end