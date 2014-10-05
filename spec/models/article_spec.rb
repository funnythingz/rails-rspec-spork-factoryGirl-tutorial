require 'rails_helper'

describe Article do
  describe '.new' do
    context 'given valid attributes' do
      subject {Article.new(:title => 'hoge', :content => 'hogehoge')}
      it {should be_valid}
    end
  end

  context 'given null title' do
    subject {Article.new(:content => 'yeah')}

    # TODO: RSpec2系だとこの書き方だが、RSpec3では動かないので書き直す
    # it {should have(1).errors_on(:title)}
  end
end
