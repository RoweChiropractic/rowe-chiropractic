class CmsPagesController < ApplicationController
  def show
    @cms_page = CmsPage.find_by(slug: params[:id]) || NullCmsPage.new(params[:id])

    @edit_path = if @cms_page.is_a?(NullCmsPage)
      new_admin_cms_page_path('cms_page[title]' => @cms_page.title)
    else
      edit_admin_cms_page_path(@cms_page)
    end

    case @cms_page.slug
    when /testimonials/
      @testimonials = Testimonial.all
    when /specialties/
      @specialties = Specialty.all
    when /contact-us/
      @inquiry = Inquiry.new
    end
  end
end
