source 'https://rubygems.org'

gem 'rails', '3.2.2'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
  
  gem 'twitter-bootstrap-rails'

  gem 'less-rails'
end

group :development do
  gem 'pg'

  # Deploy with Capistrano
  gem 'capistrano'
  gem 'rvm-capistrano'
  gem 'capistrano-unicorn', :require => false
  gem 'capistrano-file_db'
end
group :production do
  gem 'mysql'
  gem 'ruby-mysql'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

gem 'rake'

# To use debugger
# gem 'ruby-debug'

# use thin as webserver
gem 'thin'

gem "feedzirra"
gem "authlogic"
gem "high_voltage"

# elasticsearch
gem 'tire'

# pagination
#gem 'will_paginate'
gem 'kaminari'

# cron
gem 'whenever'

# database export
gem 'yaml_db'
