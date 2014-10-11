require 'spec_helper'

describe 'Phone' do

  # 連絡先ごとに重複した電話番号を許可しないこと
  it 'does not allow duplicate phone numbers per contact' do
    phone_number = Faker::PhoneNumber.phone_number
    contact = Contact.create(firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.email)
    contact.phones.create(phone_type: 'home', phone: phone_number)
    mobile_phone = contact.phones.build(phone_type: 'modile', phone: phone_number)

    expect(mobile_phone).to have(1).errors_on(:phone)
  end

  # 2件の連絡先で同じ電話番号を共有できること
  it 'allows two contacts to share a phone number' do
    phone_number = Faker::PhoneNumber.phone_number
    contact = Contact.create(firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.email)
    contact.phones.create(phone_type: 'home', phone: phone_number)
    other_contact = Contact.new
    other_phone = other_contact.phones.build(phone_type: 'home', phone: phone_number)

    expect(other_phone).to be_valid
  end
end