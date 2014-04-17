# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  nombres    :string(255)
#  email      :string(255)
#  imagen     :string(255)
#  admin      :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#  banned     :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  include Cacheable
  include Authenticable

# scopes
  scope :admins, -> { where(admin: true) }

# relationships
  has_one :profile
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

# comments reputation
  has_many :evaluations, class_name: "RSEvaluation", as: :source
  has_reputation :votes, source: {reputation: :votes, of: :comments}, aggregated_by: :sum

# methods
  def voted_for?(comment)
    evaluations.where(target_type: comment.class, target_id: comment.id).present?
  end
end
