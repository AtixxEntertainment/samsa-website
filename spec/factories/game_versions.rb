# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game_version do
    tag "MyString"
    changelog "MyText"
    url "MyString"
  end
end
