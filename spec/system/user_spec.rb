require 'rails_helper'
RSpec.describe 'User機能', type: :system do
  describe 'Userテスト' do
    before do
      @user = FactoryBot.create(:user)
      @admin_user = FactoryBot.create(:admin_user)
    end
  describe 'User登録' do
    context 'User新規登録をする場合' do
      it 'Userの登録情報が表示される' do
        visit new_user_registration_path
        fill_in "user[name]", with: @user.name
        select '30代', from: '年齢'
        select '東京都', from: 'エリア'
        fill_in "user[email]", with: 'test@test.com'
        fill_in "user[password]", with: @user.password
        fill_in "user[password_confirmation]", with: @user.password
        click_on 'アカウント登録'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end
  end

  describe 'Userログイン' do
    context 'Userがログインする場合' do
      it 'ログインした内容が表示される' do
        visit user_session_path
        fill_in "user[email]", with: @user.email
        fill_in "user[password]", with: @user.password
        binding.irb
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました。'
      end
    end
  end





end  
end