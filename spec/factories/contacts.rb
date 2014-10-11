# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'

FactoryGirl.define do
  factory :contact do
    firstname Faker::Name.first_name
    lastname Faker::Name.last_name
    email Faker::Internet.email
  end
end
