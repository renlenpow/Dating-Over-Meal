task :generate_users => :environment do
  (1000..2000).each do |i|
    birthday = Random.rand_time(70.years.ago, Time.now)
    User.create(:firstname => Random.firstname, :lastname => Random.lastname, :username => "user#{i}",  :email => "user#{i}@gmail.com", :password => "abcd1234", 
    :birth_year => birthday.year, :birth_month => birthday.strftime("%b"), :birth_day => birthday.day)
  end
end