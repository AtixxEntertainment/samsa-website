# == Schema Information
#
# Table name: preferences
#
#  id    :integer          not null, primary key
#  name  :string(255)      not null
#  value :string(255)
#

class Preference < ActiveRecord::Base
# validations
  validates :name, presence: true, uniqueness: true

# callbacks
  after_commit :flush_preference_cache

# methods
  def flush_preference_cache
    Rails.cache.delete [self.class.name, name]
  end

# class methods
  def self.landing_page
    Rails.cache.fetch([name, "landing_page"]) do
      where(name: "landing_page").first_or_initialize
    end
  end

  def self.preference(name)
    find_by! name: name
  end
end
