require 'spec_helper'

describe Interaction do
  
  it "should have a user_id and place_id" do
    
    i = Interaction.new
    i.should_not be_valid
    
    user = Factory(:user)
    place = Factory(:place)
    
    i = Interaction.new :user_id => user.id, :place_id => place.id
    
    i.should be_valid
    
  end
  
end
