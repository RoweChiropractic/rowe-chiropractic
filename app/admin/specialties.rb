ActiveAdmin.register Specialty do
  menu parent: 'Case Studies'

  permit_params :title, :body, :teaser, :featured

  index do
    column :title
    column :teaser
    column :featured
    column :created_at
    column :updated_at
    column :edited_by do |specialty|
      User.find(specialty.versions.last.whodunnit).full_name rescue 'N/A'
    end
    actions
  end


  form do |f|
    f.inputs do
      f.input :title
      f.input :featured
      f.input :teaser
      f.input :body, input_html: { class: [:code, :markdown] }
    end
    actions
  end

  show do
    panel "Table of Contents" do
      attributes_table_for specialty do
        row :title
        row :featured
        row :teaser
        row :body do |specialty|
          raw specialty.formatted_body
        end
        row :edited_by do |specialty|
          unless specialty.versions.empty?
            User.find(specialty.versions.last.whodunnit).full_name
          end
        end
        row :created_at
        row :updated_at
      end
    end
  end

end
