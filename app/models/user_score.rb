#need to add attribute Winner to Game and user course.
# if us.winner == us.game.winner && both team_prediction == game.team_score, then us.points = 10.
# elsif wnner == winner && one team_prediction == team_score, then points = 5
# also need to add total points to user and be able to add points to that
class UserScore < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  # before_save: game_not_current_or_final

  default_scope order('points DESC')

  # in us_controller add method to @user_score.update_attributes(points: @userscore.points_earned)

  def self.find_or_initialize(user, game)
    where(user: user, game: game).first_or_initialize
  end

  def update_points
    self.points = points_earned if self.game.final
  end

  def points_earned
    # if 2 or more correct either highest points are earned (current system)
    # or
    # total =[]
    # total << 20 if double_or_nothing
    return 20 if self.exact_doubled
    return 0 if self.double_or_nothing && exact_score == false
    return 10 if self.exact_score
    return 5 if self.half_plus_winner
    return 3 if correct_winner
    return 2 if correct_difference
    return 0
  end

  def exact_doubled
    exact_score && self.double_or_nothing
  end

  def exact_score
    team_1_correct && team_2_correct
  end

  def half_plus_winner
    (team_1_correct || team_2_correct) && correct_winner
  end

  def correct_winner
    actual_winner == predicted_winner
  end

  def correct_difference
    actual_difference == predicted_difference
  end

  def team_1_correct
    self.team_1_prediction == self.game.team_1_score
  end

  def team_2_correct
    self.team_2_prediction == self.game.team_2_score
  end

  def actual_winner
     return self.game.team_1 if (self.game.team_1_score > self.game.team_2_score)
     return self.game.team_2 if (self.game.team_1_score < self.game.team_2_score)
  end

  def predicted_winner
    return self.game.team_1 if (self.team_1_prediction > self.team_2_prediction)
    return self.game.team_2 if (self.team_1_prediction < self.team_2_prediction)
  end

  def actual_difference
    self.game.team_1_score - self.game.team_2_score
  end

  def predicted_difference
    self.team_1_prediction - self.team_2_prediction
  end
end
