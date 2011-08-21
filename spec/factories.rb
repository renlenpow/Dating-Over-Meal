FactoryGirl.define do
  
  factory :user do
    firstname 'First'
    lastname  'Last'
    email     'first.last@email.com'
    password  'password'
  end
  
  factory :message do
    content 'message content'
  end
  
end