class CmsPagesController < ApplicationController
  def show
    @cms_page = CmsPage.find_by(slug: params[:id]) || NullCmsPage.new(params[:id])

    case @cms_page.slug
    when /testimonials/
      @testimonials = Testimonial.all
    when /contact-us/
      @inquiry = Inquiry.new
    end
  end
end
