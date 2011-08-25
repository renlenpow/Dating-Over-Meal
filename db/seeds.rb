# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Cuisine.count == 0
  Cuisine.create(:name => "American")
  Cuisine.create(:name => "Asian")
  Cuisine.create(:name => "African")
  Cuisine.create(:name => "European")
  Cuisine.create(:name => "Central/South American")
  Cuisine.create(:name => "Mediterranean")
  Cuisine.create(:name => "Middle Eastern")
  Cuisine.create(:name => "French")
  Cuisine.create(:name => "German")
  Cuisine.create(:name => "Greek")
  Cuisine.create(:name => "Indian")
  Cuisine.create(:name => "Irish")
  Cuisine.create(:name => "Italian")
  Cuisine.create(:name => "Japanese")
  Cuisine.create(:name => "Korean")
  Cuisine.create(:name => "Mexican")
  Cuisine.create(:name => "Lebanese")
  Cuisine.create(:name => "Spanish")
  Cuisine.create(:name => "Portuguese")
  Cuisine.create(:name => "Scottish")
  Cuisine.create(:name => "Turkish")
  Cuisine.create(:name => "Thai")
  Cuisine.create(:name => "Vietnamese")
end

if Mood.count == 0
  Mood.create(:name => "Chill")
  Mood.create(:name => "Cozy")
  Mood.create(:name => "Classy")
  Mood.create(:name => "Fun")
  Mood.create(:name => "Delectable")
  Mood.create(:name => "Romantic")
  Mood.create(:name => "Special")
  Mood.create(:name => "In and Out")
  Mood.create(:name => "Innovative")
  Mood.create(:name => "Indulgen")
  Mood.create(:name => "Homestyle")
  Mood.create(:name => "Avant-garde")
  Mood.create(:name => "Exquisite")
end
