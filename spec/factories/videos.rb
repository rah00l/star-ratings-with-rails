# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :video do
    link "MyString"
    title "MyString"
    author "MyString"
    duration "MyString"
    likes 1
    dislikes 1
  end
end
