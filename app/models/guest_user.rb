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
#  banned     :boolean          default(FALSE)
#

class GuestUser < User
  def imagen
    "http://www.gravatar.com/avatar/a?d=mm&s=48"
  end
end
