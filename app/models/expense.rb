class Expense < ApplicationRecord
  belongs_to :disease
  belongs_to :user
  
  validates :treatment_cost, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 10000000 }
  validates :drug_cost, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 10000000 }
  validates :other_cost, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 10000000 }
end
