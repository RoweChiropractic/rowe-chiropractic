class CreatePatientConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :patient_conditions, id: :uuid do |t|
      t.references :patient, type: :uuid
      t.references :condition, type: :uuid

      t.timestamps
    end
  end
end
