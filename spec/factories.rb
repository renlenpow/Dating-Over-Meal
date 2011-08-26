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
  
  factory :image do
    picture_file_name     'image.jpg'
    picture_content_type  'image/jpeg'
    picture_file_size     6531
    picture_updated_at    Time.now
  end
  
end