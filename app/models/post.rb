# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  body       :text             not null
#  published  :boolean          default(FALSE)
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  slug       :string(255)
#  navbar     :boolean          default(FALSE)
#

class Post < ActiveRecord::Base
  include Cacheable
  extend FriendlyId

# scopes
  scope :only_link, -> { select(:id, :title, :slug) }
  scope :published, -> { where(published: true) }
  scope :recent,    -> { order(id: :desc) }

# friendly id
  friendly_id :title, use: :slugged

# relationships
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

# validations
  validates :title, presence: true
  validates :user_id, presence: true

# methods
  def parameterize
    slug
  end

  def to_s
    title
  end
end
