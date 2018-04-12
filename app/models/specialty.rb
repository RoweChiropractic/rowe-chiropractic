class Specialty < ApplicationRecord
  include MarkdownParser

  has_paper_trail

  validates :title, presence: true
  validates :teaser, presence: true
  validates :body, presence: true

  has_many :patient_specialties
  has_many :patients, through: :patient_specialties

  default_scope { order(:position) }
  scope :featured, -> { where featured: true }
end
