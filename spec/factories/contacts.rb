# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'

FactoryGirl.define do
  factory :contact do
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.email }

    after(:build) do |contact|
      [:home_phone, :work_phone, :modile_phone].each do |phone|
        contact.phones << FactoryGirl.build(:phone, phone_type: phone, contact: contact)
      end
    end
  end

  factory :invalid_contact do
    firstname nil
  end
end