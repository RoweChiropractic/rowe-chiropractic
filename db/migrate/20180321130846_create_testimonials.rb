class CreateTestimonials < ActiveRecord::Migration[5.2]
  def change
    create_table :testimonials, id: :uuid do |t|
      t.string :title
      t.text :body
      t.string :author
      t.boolean :featured
      t.timestamps
    end
  end
end
