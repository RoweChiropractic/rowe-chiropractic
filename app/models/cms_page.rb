class CmsPage < ApplicationRecord
  include MarkdownParser
  has_paper_trail

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :children, class_name: "CmsPage", foreign_key: :parent_id
  belongs_to :parent, class_name: "CmsPage", foreign_key: :parent_id, optional: true

  validates :title, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
end
