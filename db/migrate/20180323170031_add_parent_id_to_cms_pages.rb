class AddParentIdToCmsPages < ActiveRecord::Migration[5.2]
  def change
    add_column :cms_pages, :parent_id, :uuid
  end
end
