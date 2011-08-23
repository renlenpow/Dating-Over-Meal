require 'spec_helper'

describe Message do
  
  it "should have a content" do
    m = Message.new
    
    m.should_not be_valid
  end
  
  it "should have [no subject] as subject if a subject is not provided" do
    m = Message.new(:content => "message")
    
    m.save!
    
    m.subject.should == "[no subject]"
  end
  
  it "should exclude messages that are spam" do
    m = Factory(:message, :spam => true)
    Message.active.should_not include(m)
  end
  
  it "should exclude messages that are archived" do
    m = Factory(:message, :archived => true)
    Message.active.should_not include(m)
  end
  
  it "should exclude messages that are read" do
    m = Factory(:message, :read => true)
    Message.active.not_read.should_not include(m)
  end
  
  it "should list messages in most recent order" do
    first_message   = Factory(:message, :content => "first message")
    sleep(1)
    second_message  = Factory(:message, :content => "second message")
    
    Message.most_recent.first.should == second_message
  end
  
  it "should have child messages when applicable" do
    parent_message = Factory(:message, :content => "parent message")
    
    first_child_message   = Factory(:message, :content => "first child message", :parent_id => parent_message.id)
    second_child_message  = Factory(:message, :content => "second child message", :parent_id => parent_message.id)
    third_message = Factory(:message, :content => "third message")
    
    parent_message.child_messages.should include(first_child_message)
    parent_message.child_messages.should include(second_child_message)
    parent_message.child_messages.should_not include(third_message)
  end
  
end
