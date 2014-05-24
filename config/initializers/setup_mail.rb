ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "siomarasierra.com",
  :user_name            => "moda@siomarasierra.com",
  :password             => ENV["GMAIL_PASSWORD"],
  :authentication       => :plain,
  :enable_starttls_auto => true
}
