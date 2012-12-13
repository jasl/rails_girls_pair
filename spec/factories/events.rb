# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title "MyString"
    body "MyText"
    date "2012-12-14"
  end
end
