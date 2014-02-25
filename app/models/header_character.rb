# == Schema Information
#
# Table name: header_characters
#
#  id          :integer          not null, primary key
#  nombre      :string(255)      not null
#  profundidad :integer
#  posicion    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class HeaderCharacter < ActiveRecord::Base
  include Caching
# validations
  validates :nombre, presence: true, uniqueness: true

end
