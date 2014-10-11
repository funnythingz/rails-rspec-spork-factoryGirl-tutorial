require 'spec_helper'

describe 'Contact' do

  # 有効なファクトリを持つこと
  it 'has a valid factory' do
    expect(FactoryGirl.build(:contact)).to be_valid
  end

  # 姓と名とメールがあれば有効な状態であること
  it 'is valid with a firstname, lastname and email' do
    contact = Contact.new(firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.email)

    expect(contact).to be_valid
  end

  # 名がなければ無効な状態であること(名: 必須)
  it 'is invalid without a firstname' do
    expect(Contact.new).to have(1).errors_on(:firstname)
  end

  # 姓がなければ無効な状態であること(姓: 必須)
  it 'is invalid without a lastname' do
    expect(Contact.new).to have(1).errors_on(:lastname)
  end

  # メールアドレスがなければ無効な状態であること(メールアドレス: 必須)
  it 'is invalid without an email address' do
    expect(Contact.new).to have(1).errors_on(:email)
  end

  # 重複したメールアドレスなら無効な状態であること
  it 'is invalid with a duplicate email address' do
    email = Faker::Internet.email
    Contact.create(firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, email: email)
    contact = Contact.new(firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, email: email)

    expect(contact).to have(1).errors_on(:email)
  end

  # 連絡先のフルネームを文字列として返すこと
  it "returns a contact's full name as a string" do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    fullname = "#{first_name} #{last_name}"
    contact = Contact.new(firstname: first_name, lastname: last_name, email: Faker::Internet.email)

    expect(contact.fullname).to eq fullname
  end

  # 文字で姓をフィルタする
  describe 'filter last name by letter' do

    before :each do
      @smith = Contact.create(firstname: Faker::Name.first_name, lastname: 'Smith', email: Faker::Internet.email)
      @jones = Contact.create(firstname: Faker::Name.first_name, lastname: 'Jones', email: Faker::Internet.email)
      @johnson = Contact.create(firstname: Faker::Name.first_name, lastname: 'Johnson', email: Faker::Internet.email)
    end

    # マッチする文字の場合
    context 'matching letters' do
      it 'returns a sorted array of results that match' do
        expect(Contact.by_letter('J')).to eq [@johnson, @jones]
      end
    end

    # マッチしない文字の場合
    context 'non matching letters' do
      it 'returns a sorted array of results that match' do
        expect(Contact.by_letter('J')).to_not include @smith
      end
    end

  end
end