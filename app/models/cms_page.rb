class CmsPage < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  def formatted_body
    markdown.render body
  end

  private

  def markdown
    @markdown ||= Redcarpet::Markdown.new(renderer, extensions = {})
  end

  def renderer
    @renderer ||= Redcarpet::Render::HTML.new(render_options = {})
  end
end
