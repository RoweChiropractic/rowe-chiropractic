class CmsPagesController < ApplicationController
  def show
    @cms_page = CmsPage.find_by(slug: params[:id]) || NullCmsPage.new(params[:id])
  end
end
