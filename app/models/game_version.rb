class GameVersion < ActiveRecord::Base
  STEAM_URL = "http://store.steampowered.com/app/371320/".freeze

  scope :visible, ->{ where(hidden: false) }
  validates :tag, uniqueness: true, presence: true
end
