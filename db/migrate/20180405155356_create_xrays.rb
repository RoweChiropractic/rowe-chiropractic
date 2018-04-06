class CreateXrays < ActiveRecord::Migration[5.2]
  def change
    create_table :xrays, id: :uuid do |t|
      t.date :date
      t.string :file
      t.string :name
      t.text :description
      t.references :patient, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
