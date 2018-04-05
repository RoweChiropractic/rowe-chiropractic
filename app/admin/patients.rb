ActiveAdmin.register Patient do
  menu parent: 'Case Studies'

  config.filters = true
  filter :first_name_cont, label: 'First Name'
  filter :last_name_cont, label: 'Last Name'
  filter :conditions
  filter :testimonial_id_not_null, label: 'Has testimonial', as: :boolean

  permit_params do
    [
      :first_name,
      :last_name,
      :diagnosis,
      testimonial_attributes: [:id, :title, :body],
      xrays_attributes: [:id, :date, :description, :file, :file_cache, :name],
      condition_ids: []
    ]
  end

  # controller do
  #   def create
  #     super do |format|
  #       byebug
  #     end
  #   end
  # end

  index do
    column :first_name
    column :last_name
    column :conditions do |patient|
      patient.conditions.map(&:name).to_sentence
    end
    column :created_at
    column :updated_at
    column :edited_by do |patient|
      User.find(patient.versions.last.whodunnit).full_name rescue 'N/A'
    end

    actions
  end

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :diagnosis
    end
    f.inputs do
      f.input :conditions, as: :check_boxes, collection: Condition.all, hidden_fields: false
    end
    f.inputs do
      f.has_many :testimonial, class: :has_one do |t|
        t.input :title
        t.input :body
      end
    end
    f.inputs do
      f.has_many :xrays, new_record: 'Add New X-Ray' do |x|
        x.input :file, hint: (image_tag(x.object.file.thumb.url) if x.object.file.present?)
        x.input :file_cache, as: :hidden
        x.input :name
        x.input :date, as: :datepicker, datepicker_options: {}
        x.input :description
      end
    end
    f.actions
  end

  show title: proc { |patient| "Patient: " + patient.full_name } do
    panel "Details" do
      attributes_table_for patient do
        row :first_name
        row :last_name
        row :conditions do |patient|
          patient.conditions.map(&:name).to_sentence
        end
        row :diagnosis
        row :created_at
        row :updated_at
        row :edited_by do |patient|
          User.find(patient.versions.last.whodunnit).full_name rescue 'N/A'
        end
      end
    end
    panel "Testimonials" do
      table_for patient.testimonial do
        column :title
        column :body
      end
    end
    panel "X-Rays" do
      table_for patient.xrays do
        column :name
        column :date do |xray|
          I18n.l xray.date, format: :short_with_year
        end
        column :description
        column :file do |xray|
          image_tag xray.file.thumb.url
        end
      end
    end
  end
end
