class CreateCmsPages < ActiveRecord::Migration[5.1]
  def change
    create_table :cms_pages, id: :uuid do |t|
      t.string :title
      t.text :sub_title
      t.text :body

      t.timestamps
    end
  end
end
