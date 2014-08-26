class Download < ActiveRecord::Base
  scope :windows, ->{ where(platform: :windows) }
  scope :mac, -> { where(platform: :mac) }
end
