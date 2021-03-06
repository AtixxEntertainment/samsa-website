# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  image      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Product < ActiveRecord::Base
  translates :title, :kind, :producer, :summary,
             fallbacks_for_empty_translations: true

  mount_uploader :image, ProductImageUploader

  validates :title, presence: true
end
