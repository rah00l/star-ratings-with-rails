# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
	  email "user@example.com"
      password "changeme"
      # password_confirmation "changeme"  	
    first_name "Test"
    last_name  "User"
  end
end
