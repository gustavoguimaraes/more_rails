require 'spec_helper'

describe League do

  describe "creating a league" do
    it "successfully creates a league" do
      FactoryGirl.create(:league)
      expect(League.all.count).to eq(1)
    end
  end
end
