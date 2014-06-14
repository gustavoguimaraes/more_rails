# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :round do
    round_number 1
    round_name "Round of 4"

    factory :current_round do
      current true
    end
  end
end
