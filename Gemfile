source 'https://rubygems.org'
gem 'rails', '3.2.13'

gem 'mysql2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem "therubyracer", "~> 0.10.2"
  gem 'uglifier', '>= 1.0.3'
  gem 'zurb-foundation'
end

gem 'jquery-rails', '~> 2.3.0'

# For building authontication system
gem 'devise'

# For adding admin functionality
gem 'activeadmin'
gem 'active_admin_editor'

# for Authorization
gem 'cancan'

# For image file upload
gem 'carrierwave'

# For image processing
gem 'rmagick'

gem "mini_magick"

# For adding reputation system (voting system)
gem 'activerecord-reputation-system', require: 'reputation_system'

# For implementation of full text search added following gem
gem 'sunspot_rails'

# For staring solr server need following gem
gem 'sunspot_solr'

gem 'progress_bar'

# For implementation of endless pagination(InfiniteScrolling) feature
gem 'will_paginate',  '~> 3.0'
gem 'betterlorem', '~> 0.1.2'
gem 'bootstrap-sass', '~> 3.0.3.0'
gem 'bootstrap-will_paginate', '~> 0.0.10'

# This gem is for implementing image gallery.
gem 'hermitage'

# This gem is for populating database.
gem 'populator'

#This gem is for adding authontication withthe help of social sites like google,facebook..
gem 'omniauth'
# gem 'omniauth-oauth2'
gem 'omniauth-google-oauth2'

# for facebook authentication
gem 'omniauth-facebook'

# to add tagging
gem 'acts-as-taggable-on'

# For implementing video functionality
gem 'youtube_it', '~> 2.4.0'

# For testing app
group :development  do
  gem 'thin'
end

group :test do
  gem 'factory_girl_rails'

  # minitest-spec-rails gem makes it easy to use the
  # MiniTest::Spec DSL within your existing Rails 2.3, 3.x or 4.x test suite.
  gem 'minitest-spec-rails', '~> 4.7'

  # following gems makes dots red/green and outputs failure info inline & focues in the progress bar
  gem 'minitest-colorize'
  gem 'minitest-focus'

  # Guard allows to automatically & intelligently launch tests and
  # Guard::Minite is for minitest framework when files are modified.
  gem 'guard' # NOTE: this is necessary in newer versions
  gem 'guard-minitest'

  gem 'launchy'
  gem 'simplecov', :require => false
end

# For debugging application step by step
gem 'debugger', group: [:development, :test]

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