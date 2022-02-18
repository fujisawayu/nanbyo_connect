class Simulation < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :diagnose
  belongs_to_active_hash :severitie
  belongs_to_active_hash :hierarchie
  belongs_to_active_hash :long_term
  belongs_to_active_hash :remark

  validates :diagnose, presence: true
  validates :severitie, presence: true
  validates :hierarchie, presence: true
  validates :long_term, presence: true
  validates :remark, presence: true
end
