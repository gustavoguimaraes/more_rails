class GameScore < ActiveRecord::Base
  has_many :teams
  has_many :games

  default_scope order('schedule ASC')
end
