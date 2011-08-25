FactoryGirl.define do
  
  factory :user do
    firstname 'First'
    lastname  'Last'
    username  'username'
    email     'first.last@email.com'
    password  'password'
  end
  
  factory :message do
    content 'message content'
  end
  
  factory :cuisine do
    name 'Cuisine'
  end
  
  factory :place do
    name            'Place'
    description     'place description'
    street_address  'place street address'
    city            'place city'
  end
  
end