source 'http://rubygems.org'

gem 'rails', '3.1.0.rc6'

gem 'mysql2'

# Asset template engines
gem 'sass-rails', "~> 3.1.0.rc"
gem 'coffee-script'
gem 'uglifier'
gem 'devise',         :git => 'git://github.com/plataformatec/devise.git'
gem 'rspec-rails',    :git => 'git://github.com/rspec/rspec-rails.git'
gem 'haml',           :git => 'git://github.com/nex3/haml.git'
gem 'gravtastic',     :git => 'git://github.com/chrislloyd/gravtastic.git'
gem 'carmen',         :git => 'git://github.com/jim/carmen.git'
gem 'paperclip',      :git => 'git://github.com/thoughtbot/paperclip.git'
gem 'dynamic_form',   :git => 'git://github.com/rails/dynamic_form.git'
gem 'will_paginate',  :git => 'git://github.com/mislav/will_paginate.git', :branch => 'rails3'
gem 'friendly_id',    :git => 'git://github.com/norman/friendly_id.git'
gem 'gmaps4rails',    :git => 'git://github.com/apneadiving/Google-Maps-for-Rails.git'
gem 'paperclip-aws',  :git => 'git://github.com/igor-alexandrov/paperclip-aws.git'
gem 'randumb',        :git => 'git://github.com/spilliton/randumb.git'
gem 'jquery-rails'
gem 'aws-sdk'


# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem 'execjs'
gem 'therubyracer'

group :test, :development do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'spork'
  gem 'rspec-rails',        :git => 'git://github.com/rspec/rspec-rails.git'
  gem 'factory_girl_rails', :git => 'git://github.com/thoughtbot/factory_girl_rails.git'
  gem 'nokogiri'
  gem 'image_downloader'
  gem 'activerecord-import'
end

group :production do
  gem 'therubyracer-heroku', '0.8.1.pre3' # you will need this too
  gem 'pg'
end
