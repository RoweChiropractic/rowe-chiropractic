class HomeController < ApplicationController
  def index
    @inquiry = Inquiry.new
    @specialties = Specialty.featured
    @testimonials = Testimonial.featured
  end
end
