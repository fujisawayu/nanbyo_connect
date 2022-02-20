require 'rails_helper'
RSpec.describe 'comment機能', type: :system do
  describe 'commentテスト' do
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
    end
    context 'コメントを投稿する' do
      it '非同期でコメントが表示される' do
        disease_create
        sleep 0.3
        fill_in "comment[content]", with: 'Hello!!',match: :first
        click_on '投稿する',match: :first
        expect(page).to have_content 'Hello!!'
      end
    end
    context 'コメントを削除する' do
      it '非同期でコメントが削除される' do
        comment_create
        click_on '削除'
        expect {
          page.accept_confirm 'Are you sure？'
          expect(page).to have_content 'コメントが削除されました'
         }
      end
    end
  end
end