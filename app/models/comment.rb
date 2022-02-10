class Comment < ApplicationRecord
  belongs_to :disease
  validates :content, presence: true
end
