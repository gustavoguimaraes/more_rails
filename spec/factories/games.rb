# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    team_1 "Columbia"
    team_2 "Argentina"
    team_1_score 3
    team_2_score 1
    final false
    schedule Time.now + 1.day

    factory :game_final do
      final true
      schedule Time.now - 1.day
    end
  end
end
