class CommentNotification < ApplicationMailer
  default from: "do-no-reply@pizza-party.com"

  def notification(comment)
    @comment = comment

    mail to: "#{@comment.review.user.email}",
         subject: "#{@comment.user.username} has commented on your review"
  end
end
