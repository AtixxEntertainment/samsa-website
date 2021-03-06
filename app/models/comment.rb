# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  user_id    :integer          not null
#  body       :text             not null
#  visible    :boolean          default(TRUE)
#  created_at :datetime
#  updated_at :datetime
#  votes      :integer          default(0)
#

class Comment < ActiveRecord::Base
# relationships
  belongs_to :user
  belongs_to :post
  belongs_to :commentable, polymorphic: true

# scopes
  scope :visible, -> { where(visible: true) }
  scope :by_votes, -> { order(votes: :desc) }
  scope :recent, -> { order(id: :desc) }
  scope :with_user, -> { includes(user: :profile) }

# validations
  validates :user_id, :commentable_id, :commentable_type, :body, presence: true
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
