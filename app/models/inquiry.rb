class Inquiry < ApplicationRecord
  validates :email, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  }, allow_blank: true
  validate :phone_or_email

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def phone_or_email
    if email.blank? && phone.blank?
      errors.add :base, I18n.t('contact_form.no_preferred_contact_method')
    end
  end
end
