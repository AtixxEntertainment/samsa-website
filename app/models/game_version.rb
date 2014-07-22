class GameVersion < ActiveRecord::Base
  scope :visible, ->{ where(hidden: false) }
  validates :tag, uniqueness: true, presence: true
end
