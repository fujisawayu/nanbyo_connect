class Comment < ApplicationRecord
  belongs_to :disease
  belongs_to :user
  validates :content, presence: true
end
