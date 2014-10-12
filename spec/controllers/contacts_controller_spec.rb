require 'spec_helper'

describe ContactsController do

  describe 'GET #index' do

    # params[:letter] がある場合
    context 'with params[:letter]' do
      # すべての連絡先を配列にまとめること
      it 'populates an array of all contacts'

      # index テンプレートを表示すること
      it 'renders the :index template'
    end
  end

  describe 'GET #show' do
    # @contact に要求された連絡先を割り当てること
    it 'assigns the requested contact to @contact'

    # :show テンプレートを表示すること
    it 'renders the :show template'
  end

  describe 'GET #new' do
    # @contact に新しい連絡先を割り当てること
    it 'assigns a new Contact to @contact'

    # :new テンプレートを表示すること
    it 'renders the :new template'
  end

  describe 'GET #edit' do
    # @contact に要求された連絡先を割り当てること
    it 'assigns the requested contact to @contact'

    # :edit テンプレートを表示すること
    it 'renders the :edit template'
  end

  describe 'POST #create' do
    # 有効な属性の場合
    context 'with valid attributes' do
      # データベースに新しい連絡先を保存すること
      it 'saves the new contact in the database'

      # contacts"show" にリダイレクトすること
      it 'redirects to contacts#show'
    end

    # 無効な属性の場合
    context 'with invalid attributes' do
      # データベースに新しい連絡先を保存しないこと
      it 'does not save the new contact in the database'

      # :new テンプレートを再表示すること
      it 're-renders the :new template'
    end
  end

  describe 'PATCH #update' do
    # 有効な属性の場合
    context 'with valid attributes' do
      # データベースの連絡先を更新すること
      it 'updates the contact in the database'

      # 更新した連絡先のページへリダイレクトすること
      it 'redirects to the contact'
    end

    # 無効な属性の場合
    context 'with invalid attributes' do
      # 連絡先を更新しないこと
      it 'does not update the contact'

      # :edit テンプレートを再表示すること
      it 're-renders the :edit template'
    end
  end

  describe 'DELETE #destroy' do
    # データベースから連絡先を削除すること
    it 'deletes the contact from the database'

    # contacts#index にリダイレクトすること
    it 'redirects to contacts#index'
  end
end
