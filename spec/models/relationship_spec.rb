require 'rails_helper'
describe 'Relationship バリデーションの確認', type: :model do
  context 'フォローを空白で登録した場合' do
    it 'バリデーションが発生する' do
        relationship = Relationship.new(follower_id: '') 
        expect(relationship).not_to be_valid
    end
  end
end