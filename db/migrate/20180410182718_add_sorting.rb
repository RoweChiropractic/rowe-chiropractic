class AddSorting < ActiveRecord::Migration[5.2]
  def change
    add_column :xrays, :position, :integer
    add_column :posture_prints, :position, :integer
    add_column :patient_specialties, :position, :integer
    add_column :specialties, :position, :integer
  end
end
