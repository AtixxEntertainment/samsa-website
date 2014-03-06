# == Schema Information
#
# Table name: attachments
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  file       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Attachment < ActiveRecord::Base
# uploaders
  mount_uploader :file, AttachmentFileUploader

# validations
  validates :name, presence: true

# callbacks
  before_validation :ensure_name

# methods
  def ensure_name
    self.name = file_name if name.blank?
  end

  def file_name
    file.to_s.split("/").last.split(".").first
  end
end
