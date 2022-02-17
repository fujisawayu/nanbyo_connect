FactoryBot.define do

  factory :user do
    name { 'ゲスト' }
    email { 'guest@test.com' }
    password {'password'}
    age {'30代'}
    prefecture {'東京都'}
    self_introduction {'ゲストです。'}
    classification {'本人'}
    birthday {'2022-01-01'}
    admin {'false'}
  end

  factory :admin_user, class: User do
    name { '管理者' }
    email { 'admin@test.com' }
    password {'password'}
    age {'30代'}
    prefecture {'大阪府'}
    self_introduction {'管理者です。'}
    classification {'本人'}
    birthday {'2022-02-02'}
    admin {'true'}
  end
end