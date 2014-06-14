class UserScoresController < ApplicationController
  def create
    # return if game.current || game.final?, {notice: this game is locked for predictions}
    @user_score = UserScore.create(user: current_user)

    @user_score.update_attributes(user_score_params)
    redirect_to games_dashboard_path
  end

  def new
    # return if game.current || game.past, {notice: this game is locked for predictions}
    @game = find_game
    @user_score.first_or_initialize(user: current_user, game: @game)
    @user_score.save!
  end

  def update
    @user_score = UserScore.find(params[:id])
    @user_score.update_attributes(user_score_params)
    redirect_to games_dashboard_path, notice: "Prediction Updated"
  end

  def edit
  end

  def index
    @user_scores = UserScore.all
    # current_user.userscores.all
  end

  def show
    @user_score = UserScore.find(params[:id])
  end

  def check_and_score  #pseudocode
    # if self.team_1_prediction == self.game. team_1 score
         # && self.team_2_prediction == self.game. team_2 score
              # # then self.update_attributes(prediction_successful: true, points: 1)
      # end
  end

  # def destroy
  # end

  private

  def user_score_params
    params.require(:user_score).permit(:game_id, :team_1_prediction, :team_2_prediction, :double_or_nothing)
  end

  def find_game
    Game.find(params["game_id"])
    # should I use a game code here to discourage cheating by submitting params?
  end

  def predicted_or_unpredicted
    Game.all.each

  end
end
