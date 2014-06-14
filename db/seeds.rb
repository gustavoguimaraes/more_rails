puts "Activating SEED program"

User.destroy_all
UserScore.destroy_all
Game.destroy_all
Team.destroy_all
FactoryGirl.create(:user)
FactoryGirl.create(:admin)
@current_round = FactoryGirl.create(:current_round)
FactoryGirl.create(:round, round_number: 2, round_name: "Round of 32")

FactoryGirl.create(:team, country: "Spain", rank:1 )
FactoryGirl.create(:team, country: "Germany", rank:2 )

FactoryGirl.create(:game, team_1: "Spain", team_1_score: 2, team_2: "Germany", team_2_score: 3)
FactoryGirl.create(:game, team_1: "Argentina", team_1_score: 1, team_2: "France", team_2_score: 0)
FactoryGirl.create(:game, team_1: "Brazil", team_1_score: 1, team_2: "Croatia", team_2_score: 0)
FactoryGirl.create(:game, team_1: "Argentina", team_1_score: 0, team_2: "Mexico", team_2_score: 0, round: @current_round)

@game_final = FactoryGirl.create(:game_final, team_1: "Croatia", team_1_score: 1, team_2: "Colombia", team_2_score: 3)


FactoryGirl.create(:user_score, user: User.first, game: Game.first)
FactoryGirl.create(:user_score, user: User.first, game: @game_final, team_1_prediction: 1, team_2_prediction: 3, points: 10)

FactoryGirl.create(:admin_user)

FactoryGirl.create(:league)
FactoryGirl.create(:league, name: "Too Cool For You", location: "Astoria")

FactoryGirl.create(:membership, user: User.first, league: League.first)
FactoryGirl.create(:membership, user: User.first, league: League.last)
FactoryGirl.create(:membership, user: User.last, league: League.last)