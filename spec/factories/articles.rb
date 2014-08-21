# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do 
  		name 'Test Article'
  		content 'The best way to use this guide is to follow each step as it happens, no code or step needed to make this example application has been left out, so you can literally follow along step by step. You can get the complete code'
		# sequence(:name) { |n| "Test Article#{n}"}
	end
end
