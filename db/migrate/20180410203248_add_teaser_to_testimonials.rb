class AddTeaserToTestimonials < ActiveRecord::Migration[5.2]
  def change
    add_column :testimonials, :teaser, :text
  end
end
