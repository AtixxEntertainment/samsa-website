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

# friendly id
  friendly_id :title, use: :slugged

# relationships
  belongs_to :user
  has_many :comments, dependent: :destroy

# validations
  validates :title, presence: true
  validates :user_id, presence: true

# methods
  def parameterize
    slug
  end

  def landing?
    id == Preference.landing_page.value.to_i
  end

  def to_s
    title
  end

# class methods
  def self.landing
    find_by id: Preference.landing_page.value
  end
end
