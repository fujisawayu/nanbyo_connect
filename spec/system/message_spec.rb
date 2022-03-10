require 'rails_helper'
RSpec.describe 'message機能', type: :system do
  describe 'messageテスト' do
    def disease_create
      visit root_path
      click_on 'ゲスト管理者ログイン（閲覧用）'
      click_on 'ホーム'
      click_on '疾患選択'
      click_on '疾患登録'
      fill_in "disease[number]", with: '1'
      fill_in "disease[name]", with: '球脊髄性筋萎縮症'
      click_on '登録する'
    end
    def comment_create
      disease_create
      sleep 0.3
      fill_in "comment[content]", with: 'Hello!!',match: :first
      click_on '投稿する',match: :first
      click_on 'ログアウト'
    end
    def login
      visit new_user_registration_path
      fill_in "user[name]", with: 'テスト'
      select '30代', from: '年齢'
      select '東京都', from: 'エリア'
      fill_in "user[email]", with: 'test@test.com'
      fill_in "user[password]", with: 'password'
      click_on 'アカウント登録'
    end
  
  describe 'メッセージ送信機能' do
    context 'メッセージを送信する場合' do
      it '非同期でメッセージを送信できる' do
       comment_create
       login
       click_on '疾患選択'
       click_on '球脊髄性筋萎縮症'
       click_on 'ゲスト管理者'
       find(".btn.btn-info").click
       fill_in "message[body]", with: 'Hello!!',match: :first
       click_on 'メッセージを送る'
       expect(page).to have_content 'Hello!!'
      end
    end
  end
  describe 'メッセージ通知機能' do
    context 'メッセージ通知を確認する場合' do
      it '新着メッセージ件数が表示される' do
        comment_create
       login
       click_on '疾患選択'
       click_on '球脊髄性筋萎縮症'
       click_on 'ゲスト管理者'
       find(".btn.btn-info").click
       fill_in "message[body]", with: 'Hello!!',match: :first
       click_on 'メッセージを送る'
       click_on 'ログアウト'
       click_on 'ゲスト管理者ログイン（閲覧用）'
      click_on 'ホーム'
      click_on 'メッセージを確認する'
      expect(page).to have_content 'テストさんから1件のメッセージがあります'
      end
    end
  end
end
end