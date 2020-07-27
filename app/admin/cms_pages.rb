ActiveAdmin.register CmsPage do
  config.filters = true
  filter :title_cont, label: 'Title'
  filter :parent_title_cont, label: 'Parent Title'

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
      :parent_id,
      children_attributes: [:position, :id]
    ]
  end

  index do
    column :title, sortable: true
    column 'Parent Page', :parent, sortable: true
    column :created_at, sortable: true
    column :updated_at, sortable: true
    column :edited_by do |testimonial|
      User.find(testimonial.versions.last.whodunnit).full_name rescue 'N/A'
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
      panel 'Child Pages' do
        table_for cms_page.children, title: 'Child Pages' do
          column :title do |child|
            link_to child.title, edit_admin_cms_page_path(child)
          end
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :parent
      f.input :title
      f.input :sub_title, input_html: { rows: 3 }
      f.input :body, label: false, input_html: { class: [:code, :markdown] }
      f.inputs 'Child Pages' do
        f.has_many :children, heading: nil, sortable: :position do |child|
          child.input :title
        end
      end
    end
    f.actions
  end
end
