# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_user do
    email "example@example.com"
    password "foobarbaz"
    password_confirmation "foobarbaz"
  end
end
