class CmsPage < ApplicationRecord
  include MarkdownParser
  has_paper_trail

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
end
