class NotificationsMailer < ActionMailer::Base
  default from: "no-reply@samsarpg.com"

  def new_comment(comment)
    @comment = comment
    @commentable = comment.commentable
    recipients = Preference.subscribers_emails
    mail(subject: "Nuevo comentario en #{@commentable}", to: recipients)
  end
end
