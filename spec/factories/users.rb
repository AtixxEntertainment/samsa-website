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

FactoryGirl.define do
  factory :user do
    sequence(:nombres) { |n| "User #{n}" }
    sequence(:email) { |n| "user_#{n}@samsarpg.com" }
    imagen "https://2.gravatar.com/avatar/0a72fe3535f5c3d195e270d4b3876af4?s=400"

    trait :admin do
      admin true
    end
  end
end
