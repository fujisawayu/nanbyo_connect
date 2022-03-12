class Treatment < ApplicationRecord
  belongs_to :disease
  belongs_to :user

  validates :affected_on,  presence: true
  validates :drug_name,  presence: true
  validates :content,  presence: true, length: { in: 1..1000 }
  validates :advice,  presence: true, length: { in: 1..1000 }
end
