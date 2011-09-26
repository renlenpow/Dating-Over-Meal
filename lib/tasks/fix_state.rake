task :fix_state => :environment do
  # Place.where(:country => "US").each do |place|
  #     unless place.state.nil?
  #       place.state = Carmen.state_name(place.state)
  #       place.save
  #     end
  #   end
  Carmen.default_country = "CA"
  Place.where(:country => "CA").each do |place|
    unless place.state.nil?
      place.state = Carmen.state_name(place.state)
      place.save
    end
  end
end