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
      image_tag cms_image.image.variant(resize: '100x100')
    end
    column :title
    column :link do |cms_image|
      url_for cms_image.image
    end
    actions
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
