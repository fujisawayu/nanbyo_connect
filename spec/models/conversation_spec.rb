require 'rails_helper'
describe 'Conversation バリデーションの確認', type: :model do
  context 'メッセージルームを空白で登録した場合' do
    it 'バリデーションが発生する' do
        conversation = Conversation.new(sender_id: '') 
        expect(conversation).not_to be_valid
    end
  end
end