class Comment < ActiveRecord::Base
# relationships
  belongs_to :user
  belongs_to :post

# validations
  validates :user_id, :post_id, :body, presence: true
end
