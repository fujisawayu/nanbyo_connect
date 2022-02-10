class Disease < ApplicationRecord
  has_many :treatments, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :comments, dependent: :destroy
end
