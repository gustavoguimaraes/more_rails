# include Devise::TestHelpers


Given(/^I am logged in as a user$/) do
  @user = FactoryGirl.create(:user)
  login_as(@user, :scope => :user)
end

Given(/^there is a current round$/) do
  @round = FactoryGirl.create(:round, current: true)
end

Given(/^there is an game$/) do
  @game = FactoryGirl.create(:game)
end

Given(/^that game is in the current round$/) do
  @game.update_attributes(round: @round)
end

When(/^I visit the games dashboard$/) do
  visit games_dashboard_path
end

Then(/^I should see team one of that game$/) do
  expect(page).to have_content(@game.team_1)
end

