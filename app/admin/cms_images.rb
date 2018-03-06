ActiveAdmin.register CmsImage do
  permit_params do
    [
      :title,
      :description,
      :image
    ]
  end

  index do
    column :image do |cms_image|
      image_tag cms_image.image
    end
    column :title
    column :description
    column :created_at
    column :updated_at
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :image, as: :file
    end
    actions
  end

  show do
    attributes_table_for cms_image do
      row :title
      row :description
      row :image do |cms_image|
        image_tag cms_image.image
      end
    end
  end

end
