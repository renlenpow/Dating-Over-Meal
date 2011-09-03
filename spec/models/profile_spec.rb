require 'spec_helper'

describe Profile do
  
  it "should calculate age properly" do
    
    user = Factory(:user)
    
    profile = user.profile
    
    profile.calculate_age.should be_nil
    
    profile.update_attributes(:birth_year => 1984, :birth_month => "May", :birth_day => 30)
    
    profile.calculate_age.should == 27
    
    profile.update_attributes(:birth_year => 1984, :birth_month => "Dec", :birth_day => 22)
    
    profile.calculate_age.should == 26
    
  end
  
end
