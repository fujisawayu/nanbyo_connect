require 'rails_helper'
describe 'Disease バリデーションの確認', type: :model do
  context '疾患名を空白で登録した場合' do
    it 'バリデーションが発生する' do
        disease = Disease.new(name: '', number:'1') 
        expect(disease).not_to be_valid
    end
  end
  context '疾患番号を空白で登録した場合' do
    it 'バリデーションが発生する' do
      disease = Disease.new(name: '球脊髄性筋萎縮症', number:'') 
      expect(disease).not_to be_valid
    end
  end
end
