class Patient < ApplicationRecord
  has_paper_trail

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :patient_conditions
  has_many :conditions, through: :patient_conditions
  accepts_nested_attributes_for :conditions
  has_one :testimonial
  accepts_nested_attributes_for :testimonial, allow_destroy: true, reject_if: :all_blank
  validates_associated :testimonial
  has_many :xrays
  accepts_nested_attributes_for :xrays, allow_destroy: true, reject_if: :all_blank
  validates_associated :xrays
  has_many :posture_prints
  accepts_nested_attributes_for :posture_prints, allow_destroy: true, reject_if: :all_blank
  validates_associated :posture_prints

  def full_name
    "#{first_name} #{last_name}"
  end

end

