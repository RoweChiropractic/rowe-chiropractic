class RenameTableConditionsToSpecialties < ActiveRecord::Migration[5.2]
  def change
    rename_table 'conditions', 'specialties'
    rename_table 'patient_conditions', 'patient_specialties'
    rename_column :patient_specialties, :condition_id, :specialty_id
  end
end
