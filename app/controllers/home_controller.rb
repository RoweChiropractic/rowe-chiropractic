class HomeController < ApplicationController
  include Captcha

  before_action :setup_negative_captcha, only: :index

  def index
    @inquiry = Inquiry.new
    @specialties = Specialty.featured
    @testimonials = Testimonial.featured
  end
end
