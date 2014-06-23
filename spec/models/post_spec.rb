# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  body       :text             not null
#  published  :boolean          default(FALSE)
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  slug       :string(255)
#  navbar     :boolean          default(FALSE)
#

require "spec_helper"

describe Post do

end
