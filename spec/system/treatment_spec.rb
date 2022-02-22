require 'rails_helper'
RSpec.describe 'treatment機能', type: :system do
  describe 'diseaseテスト' do
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
    context '疾患情報を新規登録をする場合' do
      it '新規登録した内容が表示される' do
        disease_create
        click_on '情報一覧'
        click_on '情報登録'
        fill_in "treatment[drug_name]", with: 'テスト薬剤'
        fill_in "treatment[content]", with: '治療中です'
        fill_in "treatment[advice]", with: '検査が大切です'
        click_on '登録する'
        expect(page).to have_content 'テスト薬剤'
      end
    end
     context '疾患情報を編集する場合' do
       it '編集した内容が表示される' do
        disease_create
        click_on '情報一覧'
        click_on '情報登録'
        fill_in "treatment[drug_name]", with: 'テスト薬剤'
        fill_in "treatment[content]", with: '治療中です'
        fill_in "treatment[advice]", with: '検査が大切です'
        click_on '登録する'
        click_on '編集'
        fill_in "treatment[drug_name]", with: 'テスト薬剤2'
        click_on '更新する'
        expect(page).to have_content 'テスト薬剤2'
       end
     end
     context '疾患情報を削除する場合' do
      it '削除された旨が表示される' do
       disease_create
       click_on '情報一覧'
       click_on '情報登録'
       fill_in "treatment[drug_name]", with: 'テスト薬剤'
       fill_in "treatment[content]", with: '治療中です'
       fill_in "treatment[advice]", with: '検査が大切です'
       click_on '登録する'
       click_on '削除'
       expect {
        page.accept_confirm 'Are you sure？'
        expect(page).to have_content 'Treatment was successfully destroyed.'
       }
       end
    end
  end
end