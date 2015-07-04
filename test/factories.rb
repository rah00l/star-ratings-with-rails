# Factory Girl Definitions

# sugar for time-stamp as string
# def dts_string
#   FactoryGirl.generate(:timestamp).strftime("%Y-%m-%d_%H-%M-%S")
# end

# "Admin","Author","organizer","Photographer","Other" -- default_roles

FactoryGirl.define do

  sequence :email do |n|
    "test-#{n}@mail.com"
  end

  factory :role do |f|
    f.name "Admin"
  end

  factory :user do |f|
    f.email { FactoryGirl.generate(:email) }
    f.password "12345678"
  end

  # for generating time-stamps
  sequence :timestamp do |n|
    (rand*n).days.ago
  end

  # for generating names
  sequence :name do |n|
    "Article-#{n}"
  end

  # created article's basic factory stucture
  factory :article do |f|
    f.name          { FactoryGirl.generate(:name) }
    f.content      "This guide is designed for beginners who want to get started with a Rails application."
    f.created_at  { FactoryGirl.generate(:timestamp) }
    f.updated_at     nil
    f.published_at   nil
  end
end
# name: "Batman", created_at: (rand*30).days.ago, content:
