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
      image_tag cms_image.image.variant(resize: '100x100')
    end
    column :title
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
      row 'Raw' do |cms_image|
        input value: url_for(cms_image.image), class: 'image-path'
      end
      row '400px' do |cms_image|
        input value: url_for(cms_image.image.variant(resize: '400x400')), class: 'image-path'
      end
      row '200px' do |cms_image|
        input value: url_for(cms_image.image.variant(resize: '200x200')), class: 'image-path'
      end
    end
  end

end
