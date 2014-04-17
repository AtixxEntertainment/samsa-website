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

  def to_s
    name.to_s
  end

  def value=(new_value)
    if new_value.is_a?(Array)
      new_value = new_value.compact.reject(&:blank?).join(",")
    end
    super(new_value)
  end

  def value
    @value ||= begin
      value = read_attribute(:value)
      if value.to_s.include?(",")
        value.split(",")
      else
        value
      end
    end
  end

# class methods
  cattr_accessor :preferences
  self.preferences = [:landing_page, :subscribers]

  self.preferences.each do |preference|
    self.class.instance_eval do
      define_method preference do
        Rails.cache.fetch([name, preference]) do
          where(name: preference).first_or_initialize
        end
      end
    end
  end

  def self.subscribers_emails
    User.select(:email).where(id: subscribers.value).map do |user|
      user.email
    end.compact
  end

  def self.preference(name)
    find_by! name: name
  end
end
