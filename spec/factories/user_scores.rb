# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_score do
    team_1_prediction 2
    team_2_prediction 3
  end
end
