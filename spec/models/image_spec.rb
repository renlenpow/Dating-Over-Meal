require 'spec_helper'

describe Image do
  
  it "should make primary properly" do
    
    image_1 = Factory(:image, :imageable_id => 1, :imageable_type => 'Place')
    image_2 = Factory(:image, :imageable_id => 1, :imageable_type => 'Place')
    image_3 = Factory(:image, :imageable_id => 1, :imageable_type => 'Place')
    
    image_2.make_primary
    
    image_1.is_primary?.should == false
    image_2.is_primary?.should == true
    image_3.is_primary?.should == false
  end
  
end
