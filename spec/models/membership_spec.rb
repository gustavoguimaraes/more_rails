require 'spec_helper'


describe Membership do
  let(:league) { FactoryGirl.create(:league) }
  let(:user) { FactoryGirl.create(:user) }
  let(:membership) { Membership.create(user: user, league: league)}

  subject { membership }

  it { should respond_to(:user) }
  it { should respond_to(:league) }


  describe "memberships" do
    it "should save a membership" do
      membership
      expect(Membership.first).to eq(membership)
    end
  end

end
