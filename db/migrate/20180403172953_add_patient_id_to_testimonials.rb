class AddPatientIdToTestimonials < ActiveRecord::Migration[5.2]
  def change
    add_column :testimonials, :patient_id, :uuid
  end
end
