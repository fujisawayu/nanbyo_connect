require 'rails_helper'
RSpec.describe 'expense機能', type: :system do
  describe 'expenseテスト' do
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
    context '治療費情報を新規登録をする場合' do
      it '新規登録した内容が表示される' do
        disease_create
        click_on '治療費一覧'
        click_on '治療費登録'
        fill_in "expense[treatment_cost]", with: 1000
        fill_in "expense[drug_cost]", with: 1000
        fill_in "expense[other_cost]", with: 1000
        click_on '登録する'
        expect(page).to have_content '治療費情報を登録しました'
      end
    end
     context '治療費情報を編集する場合' do
       it '編集した内容が表示される' do
        disease_create
        click_on '治療費一覧'
        click_on '治療費登録'
        fill_in "expense[treatment_cost]", with: 1000
        fill_in "expense[drug_cost]", with: 1000
        fill_in "expense[other_cost]", with: 1000
        click_on '登録する'
        click_on '編集'
        fill_in "expense[treatment_cost]", with: 2000
        click_on '更新する'
        expect(page).to have_content '2,000円'
       end
     end
     context '疾患情報を削除する場合' do
      it '削除された旨が表示される' do
       disease_create
       click_on '治療費一覧'
        click_on '治療費登録'
        fill_in "expense[treatment_cost]", with: 1000
        fill_in "expense[drug_cost]", with: 1000
        fill_in "expense[other_cost]", with: 1000
        click_on '登録する'
       click_on '削除'
       expect {
        page.accept_confirm 'Are you sure？'
        expect(page).to have_content '治療費情報を削除しました'
       }
       end
    end
  end
end