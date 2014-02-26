# == Schema Information
#
# Table name: header_characters
#
#  id                  :integer          not null, primary key
#  nombre              :string(255)      not null
#  profundidad         :integer          default(1)
#  posicion_horizontal :integer          default(0)
#  posicion_vertical   :integer          default(0)
#  created_at          :datetime
#  updated_at          :datetime
#

class HeaderCharacter < ActiveRecord::Base
  include Caching
# validations
  validates :nombre, presence: true, uniqueness: true

end
