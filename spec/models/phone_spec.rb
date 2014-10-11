require 'spec_helper'

describe 'Phone' do

  # 連絡先ごとに重複した電話番号を許可しないこと
  it 'does not allow duplicate phone numbers per contact' do
    phone_number = Faker::PhoneNumber.phone_number

    contact = create(:contact)
    create(:home_phone, contact: contact, phone: phone_number)
    mobile_phone = build(:modile_phone, contact: contact, phone: phone_number)

    expect(mobile_phone).to have(1).errors_on(:phone)
  end

  # 2件の連絡先で同じ電話番号を共有できること
  it 'allows two contacts to share a phone number' do
    phone_number = Faker::PhoneNumber.phone_number
    create(:home_phone, phone: phone_number)

    expect(build(:home_phone, phone: phone_number)).to be_valid
  end
end