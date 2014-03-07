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
#

class Post < ActiveRecord::Base
# relationships
  belongs_to :user

# validations
  validates :title, presence: true
  validates :body, presence: true
  validates :user_id, presence: true

# class methods
  def self.landing
    find_by id: Preference.landing_page.value
  end
end
