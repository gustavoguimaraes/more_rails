# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username "fan"
    email "fan_@example.com"
    password "foobarbaz"

    factory :admin do
      username "admin"
      email "admin@example.com"
      admin true
    end
  end
end
