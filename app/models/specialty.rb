class Specialty < ApplicationRecord
  validates :name, presence: true

  has_many :patient_specialties
  has_many :patients, through: :patient_specialties

  default_scope { order(:position) }
end
