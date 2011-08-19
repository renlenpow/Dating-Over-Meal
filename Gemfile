source 'http://rubygems.org'

gem 'rails', '3.1.0.rc6'

gem 'mysql2'

# Asset template engines
gem 'sass-rails', "~> 3.1.0.rc"
gem 'coffee-script'
gem 'uglifier'
gem 'devise', :git => 'git://github.com/plataformatec/devise.git'
gem 'rspec-rails', :git => 'git://github.com/rspec/rspec-rails.git'
gem 'haml', :git => 'git://github.com/nex3/haml.git'
gem 'gravtastic', :git => 'git://github.com/chrislloyd/gravtastic.git'
gem 'carmen', :git => 'git://github.com/jim/carmen.git'

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem 'execjs'
gem 'therubyracer'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'spork'
  gem 'rspec-rails', :git => 'git://github.com/rspec/rspec-rails.git'
end

group :production do
  gem 'therubyracer-heroku', '0.8.1.pre3' # you will need this too
  gem 'pg'
end
