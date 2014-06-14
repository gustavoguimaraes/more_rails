Feature: Games Dashinboard
As a user
I should see upcoming games to predict
So I can play and earn points

@javascript
Scenario: Seeing Upcoming Games
  Given I am logged in as a user
  And there is a current round
  And there is an game
  And that game is in the current round
  When I visit the games dashboard
  Then I should see team one of that game


