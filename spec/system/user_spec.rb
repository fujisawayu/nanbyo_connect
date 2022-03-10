require 'rails_helper'
RSpec.describe 'User機能', type: :system do
  describe 'Userテスト' do
    before do
      @user = FactoryBot.create(:user)
      @admin_user = FactoryBot.create(:admin_user)
    end

    def login
      visit user_session_path
      fill_in "user[email]", with: @user.email
      fill_in "user[password]", with: @user.password
      click_button 'ログイン'
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
        #fill_in "user[password_confirmation]", with: @user.password
        click_on 'アカウント登録'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end
  end

  describe 'Userログイン' do
    context 'Userがログインする場合' do
      it 'ログインした内容が表示される' do
        login
        expect(page).to have_content 'ログインしました。'
        click_on 'ログアウト'
        expect(page).to have_content 'ログインもしくはアカウント登録してください。'
      end
    end
    context 'Userがログアウトする場合' do
      it 'ログアウト後にメッセージが表示される' do
        login
        click_on 'ログアウト'
        expect(page).to have_content 'ログインもしくはアカウント登録してください。'
      end
    end
  end

  describe 'Userプロフィールを編集' do
    context 'Userがプロフィールを編集する場合' do
      it 'プロフィール編集が行えメッセージが表示される' do
        login
        click_on 'マイページ'
        click_on 'プロフィール編集'
        select '大阪府', from: 'エリア'
        click_on '更新する'
        expect(page).to have_content 'プロフィールを更新しました'
      end
    end
  end
 end  
end