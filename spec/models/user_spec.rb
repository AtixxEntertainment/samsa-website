# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  nombres    :string(255)
#  email      :string(255)
#  imagen     :string(255)
#  admin      :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end
