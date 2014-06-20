source 'http://rubygems.org'
#ruby '2.0.0'
gem 'rails', '3.2.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

#gem 'sqlite3'
group :development do
  gem 'sqlite3'
end

# group :production do
#   gem 'pg'
# end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  #gem "sass", "~> 3.2.5"
  gem 'sass-rails'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
   gem "therubyracer", "~> 0.10.2"

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails', '~> 2.3.0'

gem 'devise'

gem 'activeadmin'

gem 'cancan'

gem 'debugger', group: [:development, :test]

group :production do 
  gem 'taps'
  gem 'pg'
end

gem 'rails_12factor', group: :production

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
