ActiveAdmin.register Condition do
  permit_params :name, :description

  index do
    column :name
    column :description
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
    end
    actions
  end

end
