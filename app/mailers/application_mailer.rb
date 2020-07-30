class ApplicationMailer < ActionMailer::Base
  default from: "Rowe Chiropractic <#{Rails.application.credentials.from_email}>"
  layout 'mailer'
end
