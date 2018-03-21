class CmsImage < ApplicationRecord
  has_one_attached :image
  validate :image_validation

  private

  def image_validation
    unless image.attached?
      errors[:base] << 'Please upload an image.'
    end
  end
end



  # def logo_validation
  #   if logo.attached?
  #     if logo.blob.byte_size > 1000000
  #       logo.purge
  #       errors[:base] << 'Too big'
  #     elsif !logo.blob.content_type.starts_with?('image/')
  #       logo.purge
  #       errors[:base] << 'Wrong format'
  #     end
  #   end
  # end
