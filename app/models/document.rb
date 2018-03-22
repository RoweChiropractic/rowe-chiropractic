class Document < ApplicationRecord
  mount_uploader :file, DocumentUploader

  validates :title, presence: true
  validates :file, presence: true
end
