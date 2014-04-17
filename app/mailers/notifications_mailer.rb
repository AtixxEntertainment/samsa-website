class NotificationsMailer < ActionMailer::Base
  default from: "no-reply@samsarpg.com"

  def new_comment(comment)
    @comment = comment
    @post = comment.post
    recipients = Preference.subscribers_emails
    mail(subject: "Nuevo comentario en #{@post}", to: recipients)
  end
end
