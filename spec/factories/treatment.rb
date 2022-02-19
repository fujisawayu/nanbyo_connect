FactoryBot.define do
  factory :treatment do
    affected_on { DateTime.now }
    drug_name { ' テスト ' }
    content { ' 治療しています ' }
    advice { ' 早めの治療が必要です。 ' }
  end
end