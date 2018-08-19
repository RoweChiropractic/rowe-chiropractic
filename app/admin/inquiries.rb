ActiveAdmin.register Inquiry do
  filter :name_cont, as: :string, label: 'First Name'
  filter :phone_cont, as: :string, label: 'Phone'
  filter :email_cont, as: :string, label: 'Email'

  permit_params do
    [
      :name,
      :first_name,
      :last_name,
      :phone,
      :email,
      :comment,
      :preferred_appointment_time,
      :preferred_contact_time,
      :preferred_contact_method
    ]
  end

  index do
    column :created_at
    column :name
    column :email do |inquiry|
      span class: ('text-success' if inquiry.preferred_contact_method == 'Email') do
        inquiry.email
      end
    end
    column :phone do |inquiry|
      span class: ('text-success' if inquiry.preferred_contact_method == 'Phone') do
        inquiry.phone
      end
    end
    column :comment
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      # f.input :first_name
      # f.input :last_name
      f.input :phone
      f.input :email
      f.input :comment
      f.input :preferred_appointment_time, as: :select, collection: %w(Morning Afternoon Evening)
      f.input :preferred_contact_time, as: :select, collection: %w(Morning Afternoon Evening)
      f.input :preferred_contact_method, as: :select, collection: %w(Phone Email)
    end
    actions
  end
end
