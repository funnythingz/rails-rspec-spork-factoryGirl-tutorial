require 'spec_helper'

describe 'Contact' do

  # 姓と名とメールがあれば有効な状態であること
  it 'is valid with a firstname, lastname and email' do
    contact = Contact.new(firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.email)

    expect(contact).to be_valid
  end

  # 名がなければ無効な状態であること
  it 'is invalid withoud a firstname' do
    expect(Contact.new).to have(1).errors_on(:firstname)
  end

  # 姓がなければ無効な状態であること
  it 'is invalid withoud a lastname' do
    expect(Contact.new).to have(1).errors_on(:lastname)
  end

  # メールアドレスがなければ無効な状態であること
  it 'is invalid withoud an email address' do
    email = Faker::Internet.email
    Contact.create(firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, email: email)
    contact = Contact.new(firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, email: email)

    expect(contact).to have(1).errors_on(:email)
  end

  # 重複したメールアドレスなら無効な状態であること
  it 'is invalid with a duplicate email address' do
  end

  # 連絡先のフルネームを文字列として返すこと
  it "returns a contact's full name as a string" do
  end

end