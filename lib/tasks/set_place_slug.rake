task :set_place_slug => :environment do
  Place.all.map(&:save)
end