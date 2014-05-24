class NotificationsMailer < ActionMailer::Base

  default :from => "noreply@siomarasierra.com", to: "moda@siomarasierra.com"

  def new_message(message)
    @message = message
    mail(:subject => "#{message.subject}")
  end

end