require 'rails_helper'
RSpec.describe 'simulation機能', type: :system do
  describe '医療費助成シミュレーションのテスト' do
    def guest_login
      visit root_path
      click_on 'ゲストログイン（閲覧用）'
      click_on '医療費助成シミュレーション'
    end
    def admin_login
      visit root_path
      click_on 'ゲスト管理者ログイン（閲覧用）'
      click_on '医療費助成シミュレーション'
    end
    context 'Userがシミュレーションをした場合' do
      it 'シミュレーション結果が表示される' do
        guest_login
        select '診断された', from: 'simulation[diagnose_id]'
        select '認定された', from: 'simulation[severitie_id]'
        select '上位所得', from: 'simulation[hierarchie_id]'
        select '該当しない', from: 'simulation[long_term_id]'
        select '該当しない', from: 'simulation[remark_id]'
        click_on '確認する'
        expect(page).to have_content '30,000円'
      end
    end
    context '診断されていない場合' do
      it '診断に関するメッセージが表示される' do
        guest_login
        select '診断されていない', from: 'simulation[diagnose_id]'
        select '認定されていない', from: 'simulation[severitie_id]'
        select '上位所得', from: 'simulation[hierarchie_id]'
        select '該当しない', from: 'simulation[long_term_id]'
        select '該当しない', from: 'simulation[remark_id]'
        click_on '確認する'
        expect(page).to have_content '指定都市の窓口にお問合せください。'
      end
    end
    context '生活保護者の場合' do
      it '自己負担上限0円が表示される' do
        guest_login
        select '診断された', from: 'simulation[diagnose_id]'
        select '認定された', from: 'simulation[severitie_id]'
        select '生活保護', from: 'simulation[hierarchie_id]'
        select '該当しない', from: 'simulation[long_term_id]'
        select '該当しない', from: 'simulation[remark_id]'
        click_on '確認する'
        expect(page).to have_content '0円'
      end
    end
    context '人工呼吸器装着者の場合' do
      it '自己負担上限1,000円が表示される' do
        guest_login
        select '診断された', from: 'simulation[diagnose_id]'
        select '認定された', from: 'simulation[severitie_id]'
        select '上位所得', from: 'simulation[hierarchie_id]'
        select '該当しない', from: 'simulation[long_term_id]'
        select '該当する', from: 'simulation[remark_id]'
        click_on '確認する'
        expect(page).to have_content '1,000円'
      end
    end
  end
end
