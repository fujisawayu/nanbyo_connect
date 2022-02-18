require 'rails_helper'
describe 'User バリデーションの確認', type: :model do
  context 'ログイン時に名前を空白で登録した場合' do
    it 'バリデーションが発生する' do
        user = User.new(name: '', 
          age:'20代', 
          prefecture:'東京都', 
          email:'test@test.com',
          password:'password', 
          password_confirmation:'password')
        expect(user).not_to be_valid
    end
  end
  context 'ログイン時に名前を10文字以上で登録した場合' do
    it 'バリデーションが発生する' do
        user = User.new(name: '01234567890', 
          age:'20代', 
          prefecture:'東京都', 
          email:'test@test.com',
          password:'password', 
          password_confirmation:'password')
        expect(user).not_to be_valid
    end
  end
  context 'ログイン時に年齢を選択しなかった場合' do
    it 'バリデーションが発生する' do
        user = User.new(name: 'test', 
          age:'', 
          prefecture:'東京都', 
          email:'test@test.com',
          password:'password', 
          password_confirmation:'password')
        expect(user).not_to be_valid
    end
  end
  context 'ログイン時にエリアを選択しなかった場合' do
    it 'バリデーションが発生する' do
        user = User.new(name: 'test', 
          age:'20代', 
          prefecture:'', 
          email:'test@test.com',
          password:'password', 
          password_confirmation:'password')
        expect(user).not_to be_valid
    end
  end
  context 'ログイン時にメールが空白だった場合' do
    it 'バリデーションが発生する' do
        user = User.new(name: 'test', 
          age:'20代', 
          prefecture:'東京都', 
          email:'',
          password:'password', 
          password_confirmation:'password')
        expect(user).not_to be_valid
    end
  end
  context 'ログイン時にパスワードを設定しなかった場合' do
    it 'バリデーションが発生する' do
        user = User.new(name: 'test', 
          age:'20代', 
          prefecture:'東京都', 
          email:'test@test.com',
          password:'', 
          password_confirmation:'')
        expect(user).not_to be_valid
    end
  end
end