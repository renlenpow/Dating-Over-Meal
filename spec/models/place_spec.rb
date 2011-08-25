require 'spec_helper'

describe Place do
  
  it "should have a name, description, street address, city" do
    place = Place.new
    place.should_not be_valid
    
    place = Place.new(:name => "Place 1", :description => "place 1 description", :street_address => "place 1 street address", :city => "city 1")
    place.should be_valid
  end
  
  it "should have a slug when created" do
    place = Factory(:place)
    place.slug.should_not be_nil
  end
  
  it "should have and belong to many cuisines" do
    p = Place.reflect_on_association(:cuisines)
    p.macro.should == :has_and_belongs_to_many
  end
  
  it "should have assigned cuisines on create" do
    cuisine_1 = Factory(:cuisine, :name => "Cuisine 1")
    cuisine_2 = Factory(:cuisine, :name => "Cuisine 2")
    cuisine_3 = Factory(:cuisine, :name => "Cuisine 3")
    p = Factory(:place, :cuisine_ids => [cuisine_1.id, cuisine_2.id, cuisine_3.id])
    
    p.cuisines.should include(cuisine_1)
    p.cuisines.should include(cuisine_2)
    p.cuisines.should include(cuisine_3)
  end
  
  it "should update assigned cuisines properly" do
    cuisine_1 = Factory(:cuisine, :name => "Cuisine 1")
    cuisine_2 = Factory(:cuisine, :name => "Cuisine 2")
    cuisine_3 = Factory(:cuisine, :name => "Cuisine 3")
    cuisine_4 = Factory(:cuisine, :name => "Cuisine 4")
    
    p = Factory(:place, :cuisine_ids => [cuisine_1.id, cuisine_2.id])
    
    p.cuisine_ids = [cuisine_3.id, cuisine_4.id]
    p.save!
    
    p.cuisines.should include(cuisine_3)
    p.cuisines.should include(cuisine_4)
    
    p.cuisines.should_not include(cuisine_1)
    p.cuisines.should_not include(cuisine_2)
  end
  
  it "should have and belong to many moods" do
    p = Place.reflect_on_association(:moods)
    p.macro.should == :has_and_belongs_to_many
  end
  
end
