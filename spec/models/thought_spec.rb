require 'spec_helper'

describe Thought do
  
  it "should always have a description" do
    t = Thought.new
    t.should_not be_valid
    
    t = Thought.new(:description => "thought example")
    t.should be_valid
  end
  
end
