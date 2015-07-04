require 'simplecov'
require 'simplecov-json'

# SimpleCov report will only be generated when tests are executed like :
# COVERAGE=true rake test
SimpleCov.start 'rails' do

  SimpleCov.formatters = [SimpleCov::Formatter::HTMLFormatter,
                          SimpleCov::Formatter::JSONFormatter ]
end if ENV["COVERAGE"]


ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'factory_girl_rails'

class ActionController::TestCase
  include Devise::TestHelpers
end

class ActiveSupport::TestCase
  # Transactional fixtures accelerate your tests by wrapping each test method
    # in a transaction that's rolled back on completion.  This ensures that the
    # test database remains unchanged
    self.use_transactional_fixtures = true

  # Add more helper methods to be used by all tests here...
end
