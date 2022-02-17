FactoryBot.define do

  factory :user do
    name { '' }
    emal { '' }
  end

  factory :second_user, class: Task do
    title { '' }
    content { '' }
  end
end