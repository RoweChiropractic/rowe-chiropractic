class AddTeaserToSpecialties < ActiveRecord::Migration[5.2]
  def change
    add_column :specialties, :teaser, :text
    add_column :specialties, :featured, :boolean
    rename_column :specialties, :name, :title
    rename_column :specialties, :description, :body
  end
end
