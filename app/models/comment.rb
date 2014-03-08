class Comment < ActiveRecord::Base
# relationships
  belongs_to :user
  belongs_to :post

# validations
  validates :user_id, :post_id, :body, presence: true
  validate :validate_user_allowed_to_comment

# reputation
  has_reputation :votes, source: :user, aggregated_by: :sum

# methods
  def validate_user_allowed_to_comment
    errors.add(:base, "No puedes agregar comentarios") if user.banned?
  end
end
