ActiveAdmin.register User do
  controller do
    def update
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super do |format|
        redirect_to collection_url and return if resource.valid?
      end
    end

    def create
      super do |format|
        redirect_to collection_url and return if resource.valid?
      end
    end
  end

  config.filters = true
  filter :email_cont, label: 'Email'
  filter :full_name_cont, label: 'Full Name'

  permit_params :email, :password, :password_confirmation, :first_name, :last_name

  index do
    column :email
    column :full_name do |user|
      user.full_name
    end
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  show title: '' do
    attributes_table_for user do
      row :email
      row :name
    end
  end

end
