class Xray < ApplicationRecord
  mount_uploader :file, ImageUploader

  belongs_to :patient

  validates :date, presence: true
  validates :file, presence: true
  validates :name, presence: true
end
