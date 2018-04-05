class Condition < ApplicationRecord
  validates :name, presence: true

  has_many :patient_conditions
  has_many :conditions, through: :patient_conditions

  default_scope { order(:name) }
end
