ActiveAdmin.register Testimonial do
  config.filters = true
  filter :title_cont, label: 'Title'
  filter :author_cont, label: 'Author'

  permit_params do
    [:title, :body, :author, :featured]
  end

  index do
    column :title
    column :author
    # column :featured, label: 'Featured?'
    column :created_at
    column :updated_at
    column :edited_by do |testimonial|
      unless testimonial.versions.empty?
        User.find(testimonial.versions.last.whodunnit).full_name
      end
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :body, input_html: { class: [:code, :markdown] }
      f.input :author
      # f.input :featured, label: 'Featured?'
    end
    actions
  end

  show do
    attributes_table_for testimonial do
      row :title
      row :body do |testimonial|
        raw testimonial.formatted_body
      end
      row :author
      row :edited_by do |testimonial|
        unless testimonial.versions.empty?
          User.find(testimonial.versions.last.whodunnit).full_name
        end
      end
      row :created_at
      row :updated_at
    end
  end
end
