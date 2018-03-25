class NullCmsPage
  attr_reader :key, :slug, :sub_title, :title

  def children
    []
  end

  def id; end
  def partial; end

  def initialize(slug)
    @slug = slug
    @title = slug.titleize
    @sub_title = I18n.t('null_cms_page.sub_title', link: link).html_safe
  end

  def formatted_body; end

  private

  def link
    "/admin/cms_pages/new?cms_page[title]=#{slug.titleize}"
  end
end
