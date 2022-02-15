class Disease < ApplicationRecord
  has_many :treatments, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :onsets, dependent: :destroy
  has_many :onset_users, through: :onsets, source: :user
end
