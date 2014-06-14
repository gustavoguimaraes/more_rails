class GamesController < ApplicationController

  before_filter :authenticate_user!
  # def upcoming
  #   @upcoming = Game.this_week
  #   game= find_game
  #   @user_score = User_score.find_or_initialize(user: current_user, game: game)
  # end

  def index
    @games = Game.all
  end

  def current
     # current games (add field for current in database)
  end

  def dashboard
    # needs refactoring
    @current_round = Round.find_by(current: true)
    @upcoming = @current_round.games if @current_round
    @today = Game.today
    @finished = Game.finished
  end
end
