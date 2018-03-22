class Testimonial < ApplicationRecord
  include MarkdownParser

  has_paper_trail

  validates :title, presence: true
  validates :body, presence: true
  validates :author, presence: true
end
