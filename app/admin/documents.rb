ActiveAdmin.register Document do
  controller do
    def create
      super do |format|
        redirect_to collection_url and return if resource.valid?
      end
    end

    def update
      super do |format|
        redirect_to collection_url and return if resource.valid?
      end
    end
  end

  permit_params do
    [:title, :description, :file]
  end

  index do
    column :title
    column :file do |document|
      link_to 'Download', document.file.url
    end
    actions
  end
end
