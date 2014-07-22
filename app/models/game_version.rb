class GameVersion < ActiveRecord::Base
  validates :tag, uniqueness: true, presence: true
end
