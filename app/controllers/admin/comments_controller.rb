module Admin
  class CommentsController < AdminController
    expose :comment

    def toggle
      comment.toggle! :visible
      self.comment = comment.decorate
    end
  end
end
