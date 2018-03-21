ActiveAdmin.register CmsImage do
  config.filters = false

  permit_params do
    [
      :title,
      :description,
      :image
    ]
  end

  index do
    column :image do |cms_image|
      image_tag cms_image.image.thumb.url
    end
    column :title
    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
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
        image_tag cms_image.image.url
      end
      row 'Raw' do |cms_image|
        input value: cms_image.image.url, class: 'image-path'
      end
      row '400px' do |cms_image|
        input value: cms_image.image.x400.url, class: 'image-path'
      end
      row '200px' do |cms_image|
        input value: cms_image.image.x200.url, class: 'image-path'
      end
    end
  end

end
