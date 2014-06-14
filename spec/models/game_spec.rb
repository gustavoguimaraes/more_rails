require 'spec_helper'

describe Game do
  let(:game) { FactoryGirl.create(:game, team_1_score: 1, team_2_score: 2, final: true) }
  let(:user) { FactoryGirl.create(:user) }
  let(:user_score) { UserScore.create(user: user, game: game, team_1_prediction: 1, team_2_prediction: 2)}

  subject { game }

  it { should respond_to(:team_1) }
  it { should respond_to(:team_2) }
  it { should respond_to(:team_1_score) }
  it { should respond_to(:team_2_score) }
  it { should respond_to(:round) }
  it { should respond_to(:final) }

  # describe "update_us_points" do
  #   xit "changes user_score points" do
  #     # move to admin test http://stackoverflow.com/questions/18240851/write-controller-and-feature-specs-for-activeadmin-using-rspec
  #     game.update_us_points
  #     expect(user_score.points).to eq(10)
  #   end
  # end
end
