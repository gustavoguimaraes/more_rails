#need to add attribute Winner to Game and user course.
# if us.winner == us.game.winner && both team_prediction == game.team_score, then us.points = 10.
# elsif wnner == winner && one team_prediction == team_score, then points = 5
class Game < ActiveRecord::Base
  has_many :teams
  has_many :user_scores

  belongs_to :round

  default_scope order('schedule ASC')
# http://www.fifa.com/worldcup/teams/
  TEAMS = [
            "Colombia", "Brazil", "Argentina", "Chile", "Ecuador", "Uruguay",
            "Belguim", "Bosnia and Herzegovina", "Croatia", "England", "France", "Germany", "Greece", "Italy", "Netherlands", "Portugal", "Russia", "Spain", "Switzerland",
            "Costa Rica", "Honduras", "Mexico", "USA",
            "Australia", "Iran", "Japan", "Korea Republic",
            "Algeria", "Cameroon", "Cote d'Ivoire", "Ghana", "Nigeria"
          ]
  # ROUNDS = [1,2,3,4,5,6]

  def self.teams
    TEAMS.sort
  end

  # def self.rounds
  #   ROUNDS
  # end

  def self.upcoming_sort
    order('schedule asc')
  end

  def self.finished_sort
    order('schedule desc')
  end

  def self.upcoming
    where(final: false).upcoming_sort
  end

  def self.predict_round
    round.current
  end

  def self.this_week
    where(schedule: (Time.now)..(Time.now + 2.days)).upcoming_sort
  end

  def self.predict_round
    round
  end

  def self.finished
    where(final: true).finished_sort
  end

  def finished?
    self.final
  end

  def self.today
    where(schedule: (Time.now.beginning_of_day)...(Time.now.end_of_day)).upcoming_sort
  end

  def find_user_score(user)
    self.user_scores.find_by(user: user)
  end

  def user_score_exists?(user)
    self.user_scores.find_by(user: user).present?
  end

end
