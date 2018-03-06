class CreateCmsImages < ActiveRecord::Migration[5.2]
  def change
    create_table :cms_images, id: :uuid do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
