class AdminController < ApplicationController
  before_filter :confirm_logged_in_is_admin, :set_active

  layout "admin"

  expose(:latest_comments) {
    Comment.recent.with_user.limit(10).inject({}) do |hash, comment|
      hash.tap do |hash|
        hash[comment.post_id] ||= []
        hash[comment.post_id] << comment
      end
    end
  }
  expose(:latest_post_comments) {
    Post.where(id: latest_comments.keys).only_link.decorate
  }

  def index
  end

  protected

  def confirm_logged_in_is_admin
    if not current_user or not current_user.admin?
      redirect_to root_path
      false
    end
  end

  private

  def set_active
  end
end
