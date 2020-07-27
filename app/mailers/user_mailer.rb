class UserMailer < ApplicationMailer
  def new_inquiry(inquiry)
    @inquiry = inquiry
    @url  = admin_inquiry_url(inquiry)
    mail(
      to: Rails.application.credentials.from_email,
      subject: 'New inquiry from RoweChiropractic.com'
    )
  end
end
