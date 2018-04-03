ActiveAdmin.register Patient do
  permit_params :first_name, :last_name

  index do
    column :first_name
    column :last_name
  end

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
    end
    actions
  end

end
