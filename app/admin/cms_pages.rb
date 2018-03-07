ActiveAdmin.register CmsPage do
  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

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

  show title: '' do
    render 'cms_pages/cms_page_content'
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
