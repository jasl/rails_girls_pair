# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :participator do
    user nil
    event nil
    invited false
    attended false
  end
end
