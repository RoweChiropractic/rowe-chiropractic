class Testimonial < ApplicationRecord
  include MarkdownParser

  has_paper_trail

  belongs_to :patient, optional: true

  validates :title, presence: true
  validates :body, presence: true
  validates :author, presence: true, if: Proc.new { |testimonial| testimonial.patient.nil? }
  validates :patient, presence: true, if: Proc.new { |testimonial| testimonial.author.blank? }
end
