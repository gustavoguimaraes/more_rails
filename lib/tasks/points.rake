namespace :scoring do

  desc "Update user points and rank"

  # task :us_points do
  #   UserScore.update_points
  # end


  task :user_points do
    User.update_total_points
  end

  task :rank_users => [:user_points ] do
    User.rank_users
  end

  # task :rank_members =>  [:us_points, :user_points, :rank_users ] do
    # Membership.rank_members
  # end


end

# Another rake task: (another file?)

# task :lock_games
#   Games.lock_one_hour_before_game
  # for now if a user_score is attempted and it is one hour before game starts
  #   mark that game as "current", add logic to upcoming to be current_round and
  #   not game.current
# end