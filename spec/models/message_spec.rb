require 'rails_helper'
describe 'Message バリデーションの確認', type: :model do
  context 'メッセージを空白で登録した場合' do
    it 'バリデーションが発生する' do
        message = Message.new(body: '') 
        expect(message).not_to be_valid
    end
  end
end