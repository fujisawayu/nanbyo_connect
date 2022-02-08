class Disease < ApplicationRecord
  has_many :treatments
  has_many :expenses
end
