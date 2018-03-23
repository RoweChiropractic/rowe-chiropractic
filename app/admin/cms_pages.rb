ActiveAdmin.register CmsPage do
  config.filters = false

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  permit_params do
    [
      :title,
      :sub_title,
      :body,
      :parent_id
    ]
  end

  index do
    column :title
    column :created_at
    column :updated_at
    column :edited_by do |testimonial|
      unless testimonial.versions.empty?
        User.find(testimonial.versions.last.whodunnit).full_name
      end
    end
    actions
  end

  show title: '' do
    attributes_table_for cms_page do
      row :parent
      row :link do |cms_page|
        div
          span class: 'cms-page-path' do
            cms_page_path(cms_page)
          end
          link_to 'Preview', cms_page_path(cms_page), target: '_blank'
      end
      row :content do |cms_page|
        render 'cms_pages/cms_page_content'
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :parent
      f.input :title
      f.input :sub_title
      f.input :body, label: false, input_html: { class: [:code, :markdown] }
    end
    f.actions
  end
end
