task :upload_place_images => :environment do
  Place.where("country = 'CA' and scrape_image_url IS NOT NULL").each do |place|
    image = Image.new
    image.picture = File.open("/Users/trivuong/Projects/Dating-Over-Meal/restaurants/#{place.scrape_image_url}")
    image.save!
    place.images << image
    place.save
  end
end