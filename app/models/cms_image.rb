class CmsImage < ApplicationRecord
  has_paper_trail

  mount_uploader :image, ImageUploader

  validates :image, presence: true
end
