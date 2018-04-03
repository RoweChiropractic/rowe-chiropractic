ActiveAdmin.register Patient do
  permit_params :first_name, :last_name, condition_ids: []

  index do
    column :first_name
    column :last_name
    column :conditions do |patient|
      patient.conditions.map(&:name).to_sentence
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
    end
    f.inputs do
      f.input :conditions, as: :check_boxes, collection: Condition.all, include_hidden: false
    end
    actions
  end

  show do
    panel "Patient Details" do
      attributes_table_for patient do
        row :first_name
        row :last_name
        row :conditions do |patient|
          patient.conditions.map(&:name).to_sentence
        end
        row :created_at
        row :updated_at
      end
    end
  end
end
