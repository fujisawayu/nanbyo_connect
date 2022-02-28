class Treatment < ApplicationRecord
  belongs_to :disease
  belongs_to :user

  validates :affected_on,  presence: true
  validates :drug_name,  presence: true
  validates :content,  presence: true
  validates :advice,  presence: true
end
