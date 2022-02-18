require 'rails_helper'
describe 'Expenses バリデーションの確認', type: :model do
  context '治療費を空白で登録した場合' do
    it 'バリデーションが発生する' do
        expense = Expense.new(treatment_cost: '', drug_cost:'1000', other_cost: '1000') 
        expect(expense).not_to be_valid
    end
  end
  context '薬剤費を空白で登録した場合' do
    it 'バリデーションが発生する' do
        expense = Expense.new(treatment_cost: '1000', drug_cost:'', other_cost: '1000') 
        expect(expense).not_to be_valid
    end
  end
  context 'その他費用を空白で登録した場合' do
    it 'バリデーションが発生する' do
        expense = Expense.new(treatment_cost: '1000', drug_cost:'1000', other_cost: '') 
        expect(expense).not_to be_valid
    end
  end
end
