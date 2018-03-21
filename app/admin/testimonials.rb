ActiveAdmin.register Testimonial do
  config.filters = true
  filter :title_cont, label: 'Title'
  filter :author_cont, label: 'Author'

  permit_params do
    [:title, :body, :author, :featured]
  end

  index do
    column :title
    column :body
    column :author
    column :featured, label: 'Featured?'
    column :created_at
    column :updated_at
    column :edited_by do |testimonial|
      User.find(testimonial.versions.last.whodunnit).full_name
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :author
      f.input :featured, label: 'Featured?'
    end
    actions
  end
end
