ActiveAdmin.register Specialty do
  menu parent: 'Case Studies'

  permit_params :name, :description

  index do
    column :name
    column :description
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
    end
    actions
  end

end
