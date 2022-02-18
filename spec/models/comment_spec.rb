require 'rails_helper'
describe 'Comment バリデーションの確認', type: :model do
  context 'コメントを空白で登録した場合' do
    it 'バリデーションが発生する' do
        comment = Comment.new(content: '') 
        expect(comment).not_to be_valid
    end
  end
end