module MarkdownParser
  def formatted_body
    body.present? ? markdown.render(body) : nil
  end

  private

  def markdown
    @markdown ||= Redcarpet::Markdown.new(renderer, extensions = {})
  end

  def renderer
    @renderer ||= Redcarpet::Render::HTML.new(render_options = {})
  end
end
