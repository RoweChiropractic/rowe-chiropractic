class AddPositionToCmsPages < ActiveRecord::Migration[5.2]
  def change
    add_column :cms_pages, :position, :integer
  end
end
