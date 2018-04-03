class Patient < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :patient_conditions
  has_many :conditions, through: :patient_conditions
  accepts_nested_attributes_for :conditions
end
