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

FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "Post #{n}" }
    body "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    published true

    association :user, :admin

    trait :navbar do
      navbar true
    end
  end
end
