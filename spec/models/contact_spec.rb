require 'spec_helper'

describe 'Contact' do

  # 有効なファクトリを持つこと
  it 'has a valid factory' do
    expect(build(:contact)).to be_valid
  end

  # 名がなければ無効な状態であること(名: 必須)
  it 'is invalid without a firstname' do
    expect(build(:contact, firstname: nil)).to have(1).errors_on(:firstname)
  end

  # 姓がなければ無効な状態であること(姓: 必須)
  it 'is invalid without a lastname' do
    expect(build(:contact, lastname: nil)).to have(1).errors_on(:lastname)
  end

  # メールアドレスがなければ無効な状態であること(メールアドレス: 必須)
  it 'is invalid without an email address' do
    expect(build(:contact, email: nil)).to have(1).errors_on(:email)
  end

  # 重複したメールアドレスなら無効な状態であること
  it 'is invalid with a duplicate email address' do
    email = Faker::Internet.email
    create(:contact, email: email)
    contact = build(:contact, email: email)

    expect(contact).to have(1).errors_on(:email)
  end

  # 連絡先のフルネームを文字列として返すこと
  it "returns a contact's full name as a string" do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    contact = build(:contact, lastname: last_name, firstname: first_name)

    expect(contact.fullname).to eq "#{first_name} #{last_name}"
  end

  # 文字で姓をフィルタする
  describe 'filter last name by letter' do

    before :each do
      @smith = create(:contact, lastname: 'Smith')
      @jones = create(:contact, lastname: 'Jones')
      @johnson = create(:contact, lastname: 'Johnson')
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

  # 3つの電話番号をもっていること
  it 'has three phone numbers' do
    expect(create(:contact).phones.count).to eq 3
  end
end