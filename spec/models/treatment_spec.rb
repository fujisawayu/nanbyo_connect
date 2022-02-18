require 'rails_helper'
describe 'Treatment バリデーションの確認', type: :model do
  context '罹患日を空白で登録した場合' do
    it 'バリデーションが発生する' do
        treatment = Treatment.new(affected_on: '', drug_name:'test', content: '治療中です。', advice: '早期痔受診を！') 
        expect(treatment).not_to be_valid
    end
  end
  context '薬剤名を空白で登録した場合' do
    it 'バリデーションが発生する' do
        treatment = Treatment.new(affected_on: '2022-01-01', drug_name:'', content: '治療中です。', advice: '早期痔受診を！') 
        expect(treatment).not_to be_valid
    end
  end
  context '内容を空白で登録した場合' do
    it 'バリデーションが発生する' do
        treatment = Treatment.new(affected_on: '2022-01-01', drug_name:'test', content: '', advice: '早期痔受診を！') 
        expect(treatment).not_to be_valid
    end
  end
  context '内容を空白で登録した場合' do
    it 'バリデーションが発生する' do
        treatment = Treatment.new(affected_on: '2022-01-01', drug_name:'test', content: '治療中です。', advice: '') 
        expect(treatment).not_to be_valid
    end
  end
end