class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.text :comment
      t.string :preferred_appointment_time
      t.string :preferred_contact_time
      t.string :preferred_contact_method

      t.timestamps
    end
  end
end
