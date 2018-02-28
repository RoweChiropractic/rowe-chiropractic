class CmsPage < ApplicationRecord
  def formatted_body
    markdown.render body
  end

  private

  def markdown
    @markdown ||= CheckboxMarkdown.new Redcarpet::Render::HTML
  end
end
