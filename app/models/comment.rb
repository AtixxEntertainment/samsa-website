class Comment < ActiveRecord::Base
# relationships
  belongs_to :user
  belongs_to :post

# scopes
  scope :by_votes, -> {
    order(votes: :desc)
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

  def update_votes_count!
    update votes: reputation_for(:votes).to_i
  end

  def vote!(value, user)
    int_value = if value == "up" then 1 else -1 end
    add_or_update_evaluation :votes, int_value, user
    update_votes_count!
  end

# class methods
  def self.random
    offset = rand count
    offset(offset).limit(1)
  end
end
