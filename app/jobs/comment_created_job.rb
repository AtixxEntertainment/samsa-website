class CommentCreatedJob
  include SuckerPunch::Job

  def perform(comment_id)
    ActiveRecord::Base.connection_pool.with_connection do
      comment = Comment.find comment_id
      NotificationsMailer.new_comment(comment).deliver
    end
  end
end
