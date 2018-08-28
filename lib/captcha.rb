module Captcha
  private

  def setup_negative_captcha
    @captcha = NegativeCaptcha.new(
      # A secret key entered in environment.rb. 'rake secret' will give you a good one.
      secret: ENV['negative_captcha_secret'],
      spinner: request.remote_ip,
      # Whatever fields are in your form
      fields: [:name, :email, :body],
      # If you wish to override the default CSS styles (position: absolute; left: -2000px;) used to position the fields off-screen
      css: "display: none",
      params: params
    )
  end
end
