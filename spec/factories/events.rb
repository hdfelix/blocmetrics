# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    referer "MyString"
    name "MyString"
    property_1 "MyString"
    property_2 "MyString"
    created_on "2014-06-07"
  end
end
