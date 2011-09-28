require 'spec_helper'

describe Album do
  
  before(:each) do
    @album = Factory(:album)
  end
  
  it "should have many images" do
    @album.should respond_to(:images)
  end
  
end
