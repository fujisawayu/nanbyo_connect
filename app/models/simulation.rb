class Simulation < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :diagnose
  belongs_to_active_hash :severitie
  belongs_to_active_hash :hierarchie
  belongs_to_active_hash :long_term
  belongs_to_active_hash :remark
end
