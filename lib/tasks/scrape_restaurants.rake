task :scrape_restaurants => :environment do
  
  puts "Scraping restaurants"
  
  cities = [
    # 'atlanta-georgia-restaurant-listings',
    # 'baltimore-maryland-restaurant-listings',
    # 'new-england-restaurant-listings',
    # 'houston-texas-restaurant-listings',
    # 'chicago-illinois-restaurant-listings',
    # 'los-angeles-restaurant-listings',
    # 'miami-restaurant-listings',
    # 'new-york-restaurant-listings',
    # 'philadelphia-pennsylvania-restaurant-listings',
    # 'washington-dc-restaurant-listings',
    # 'hawaii-restaurant-listings',
    # 
    # 'columbus-ohio-restaurant-listings',
    # 'houston-texas-restaurant-listings',
    # 'phoenix-restaurant-listings',
    # 'new-orleans-louisiana-restaurant-listings',
    # 'jacksonville-florida-restaurant-listings',
    # 'san-francisco-bay-area-restaurant-listings',
    # 'minneapolis-minnesota-restaurant-listings',
    # 'las-vegas-restaurant-listings',
    # 'oklahoma-restaurant-listings',
    # 'wisconsin-restaurant-listings',
    # 'kansas-city-kansas-restaurant-listings',
    # 'michigan-restaurant-listings',
    # 'denver-colorado-restaurant-listings'
    
    'toronto-ontario-restaurant-listings',
    'montreal-quebec-restaurant-listings',
    'vancouver-british-columbia-restaurant-listings'
  ]
  
  places = []
  
  cities.each do |city|
    doc = Nokogiri::HTML(open("http://www.opentable.com/#{city}"))
    
    price_ranges = [1, 2, 3, 4]
    
    restaurant_listing_grid = doc.css("table#AlRestList_ResultsGrid div.rinfo a.r").each do |a|
      restaurant_href = a['href']
      restaurant_doc = Nokogiri::HTML(open("http://www.opentable.com/#{restaurant_href}"))
      
      name = restaurant_doc.css("div#tab_wrapper h1.RestProfileTitle").text.strip
      street_address = restaurant_doc.css("div#tab_wrapper div.RestProfileAddress").inner_html
      
      address = street_address.split("<br>").first.split(",").first.strip
      city_state = street_address.split("<br>").last.split(", ")
      
      city = city_state.first
      
      state_zip = city_state.last.split(" ")
      
      state = state_zip.first
      zipcode = state_zip[1] + " " + state_zip.last
      
      hours = restaurant_doc.css("span#RestaurantProfile_RestaurantProfileInfo_lblHoursOfOperation").text.gsub("Hours of Operation: ", "")
      parking = restaurant_doc.css("span#RestaurantProfile_RestaurantProfileInfo_lblParkingDetails").text.gsub("Parking Details: ", "")
      payment = restaurant_doc.css("span#RestaurantProfile_RestaurantProfileInfo_lblPayment").text.gsub("Payment Options:", "")
      phone_number = restaurant_doc.css("span#RestaurantProfile_RestaurantProfileInfo_lblPhone").text.gsub("Phone: ", "")
      website = restaurant_doc.css("span#RestaurantProfile_RestaurantProfileInfo_lblWebsite").text.gsub("Website: ", "")
      description = restaurant_doc.css("span#RestaurantProfile_RestaurantProfileInfo_lblDescription").text
      
      place = Place.new(
        :name             => name,
        :price_range      => price_ranges[rand(3)],
        :street_address   => address,
        :city             => city,
        :state            => state,
        :country          => "CA",
        :zipcode          => zipcode,
        :hours            => hours,
        :parking          => parking,
        :payment          => payment,
        :phone_number     => phone_number,
        :website          => website,
        :description      => description
      )
      
      #Download restaurant avatar
      restaurant_image = restaurant_doc.css("a#RestaurantProfile_linkRestarantImage img").first
      
      unless restaurant_image.nil?
        writeOut = open("/Users/trivuong/Projects/Dating-Over-Meal/restaurants/#{restaurant_image['src'].split("/").last}", "wb")
        writeOut.write(open("http://www.opentable.com/#{restaurant_image['src']}").read)
        writeOut.close
        
        place.scrape_image_url = restaurant_image['src'].split("/").last
      end
      
      places << place
      
      if (places.count % 100) == 0
        Place.import places
        places = []
      end
      
    end
  end
  
  if places.count > 0
    Place.import places
  end
  
end