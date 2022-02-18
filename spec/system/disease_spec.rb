require 'rails_helper'
RSpec.describe 'disease機能', type: :system do
  describe 'diseaseテスト' do
    before do
      disease = FactoryBot.create(:disease)
    end
    def login
      visit new_user_registration_path
      fill_in "user[name]", with: 'ゲスト'
      select '30代', from: '年齢'
      select '東京都', from: 'エリア'
      fill_in "user[email]", with: 'test@test.com'
      fill_in "user[password]", with: 'password'
      fill_in "user[password_confirmation]", with: 'password'
      click_on 'アカウント登録'
    end
  
  describe 'disease登録機能' do
    context 'diseaseを新規登録をする場合' do
      it '管理者のみが登録できる' do
       visit root_path
       click_on 'ゲスト管理者ログイン（閲覧用）'
       click_on 'ホーム'
       click_on '疾患選択'
       click_on '疾患登録'
       fill_in "disease[number]", with: '1'
       fill_in "disease[name]", with: '球脊髄性筋萎縮症'
       click_on '登録する'
       expect(page).to have_content '球脊髄性筋萎縮症'
      end
    end
    context 'diseaseを新規登録をする場合' do
      it '一般Userは登録できない' do
        visit root_path
        click_on 'ゲストログイン（閲覧用）'
        visit "/diseases/new"
        expect(page).to have_content 'アクセス権がありません'
      end
    end
    context 'diseaseを空白で登録をする場合' do
      it '登録できない旨が表示される' do
       visit root_path
       click_on 'ゲスト管理者ログイン（閲覧用）'
       click_on 'ホーム'
       click_on '疾患選択'
       click_on '疾患登録'
       fill_in "disease[number]", with: '1'
       fill_in "disease[name]", with: ''
       click_on '登録する'
       expect(page).to have_content '疾患名を入力してください'
      end
    end
  end
  end
end
