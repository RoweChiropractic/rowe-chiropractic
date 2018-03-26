module MarkdownParser
  def formatted_body
    body.present? ? CommonMarker.render_html(body) : nil
  end
end
