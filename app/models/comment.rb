class Comment < ActiveRecord::Base
# relationships
  belongs_to :user
  belongs_to :post

# scopes
  scope :by_votes, -> {
    # find_with_reputation(:votes, :all, sort: "votes desc")   # doesn't work with rails 4
    all.sort { |x,y| y.votes <=> x.votes }
  }

# validations
  validates :user_id, :post_id, :body, presence: true
  validate :validate_user_allowed_to_comment

# reputation
  has_reputation :votes, source: :user, aggregated_by: :sum

# methods
  def validate_user_allowed_to_comment
    errors.add(:base, "No puedes agregar comentarios") if user.banned?
  end

  def votes
    @votes ||= reputation_for(:votes).to_i
  end
end
