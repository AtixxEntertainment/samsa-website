# == Schema Information
#
# Table name: profiles
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  uid          :string(255)      not null
#  provider     :string(255)      not null
#  name         :string(255)
#  nickname     :string(255)
#  email        :string(255)
#  image        :string(255)
#  location     :string(255)
#  description  :string(255)
#  token_access :string(255)
#  token_secret :string(255)
#  raw_info     :text
#  urls         :text
#  created_at   :datetime
#  updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
  end
end
