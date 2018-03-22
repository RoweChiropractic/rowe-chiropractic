module MarkdownParser
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
