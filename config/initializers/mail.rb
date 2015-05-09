ActionMailer::Base.smtp_settings = {
  :address              => 'admin.aimath.org',
  :port                 => 587,
  :domain               => 'www.aimath.org',
  :user_name            => ENV["AIM_MAIL_USERNAME"],
  :password             => ENV["AIM_MAIL_PASSWORD"],
  :authentication       => :plain,
  :enable_starttls_auto => true
}