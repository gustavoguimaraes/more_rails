require 'spec_helper'


describe UserScore do
  let(:game) { FactoryGirl.create(:game, team_1_score: 1, team_2_score: 2, final: true) }
  let(:user) { FactoryGirl.create(:user) }
  let(:user_score) { UserScore.create(user: user, game: game, team_1_prediction: 1, team_2_prediction: 2)}

  subject { user_score }

  it { should respond_to(:user) }
  it { should respond_to(:game) }
  it { should respond_to(:team_1_prediction) }
  it { should respond_to(:team_2_prediction) }
  it { should respond_to(:points) }
  it { should respond_to(:double_or_nothing)}



  describe ".find_or_initialize(user, course)" do
    it "should find a user_score if it exists" do
      user_score
      expect(UserScore.find_or_initialize(user, game)).to eq(user_score)
    end
  end

  describe "update_points" do
    it "should return 10 points for a perfect prediction without double or nothing" do
      user_score.update_points
      user_score.save!
      expect(user_score.points).to eq(10)
    end

     it "should return 20 points for a perfect prediction with double or nothing" do
      user_score.update_attributes(double_or_nothing: true)
      user_score.update_points
      user_score.save!
      expect(user_score.points).to eq(20)
    end

    it "should return 5 points if prediction includes correct winner and one correct score" do
      user_score.update_attributes(team_2_prediction: 3)
      user_score.update_points
      user_score.save!
      expect(user_score.points).to eq(5)
    end
  end
end
