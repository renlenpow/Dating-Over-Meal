task :upload_user_avatar => :environment do
  avatars_folder = Dir.entries("/Users/trivuong/Projects/Dating-Over-Meal/celebrities")
  
  avatars_count = avatars_folder.count
  
  r = Random.new
  
  User.all.each do |user|
    user.avatar = File.open("/Users/trivuong/Projects/Dating-Over-Meal/celebrities/#{avatars_folder[r.rand(2..(avatars_count))]}")
    user.save
  end
end