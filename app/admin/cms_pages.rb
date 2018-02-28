ActiveAdmin.register CmsPage do
  permit_params do
    [
      :title,
      :sub_title,
      :body
    ]
  end

  index do
    column :title
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :title
      row :sub_title
      row :body do |doc|
        raw doc.formatted_body
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :sub_title
      f.input :body, label: false, input_html: { class: [:code, :markdown] }
    end
    f.actions
  end
end
