class HomeController < ApplicationController
  def index
    @inquiry = Inquiry.new
    @specialties = Specialty.all
    @testimonials = Testimonial.featured
  end
end
