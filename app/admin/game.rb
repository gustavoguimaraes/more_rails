ActiveAdmin.register Game do
  # has_many :rounds

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :lock_predictions, :team_1, :team_2, :team_1_score, :team_2_score, :final, :schedule, :round_number, :round_id

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :round_id, prompt: "Select One", as: :select, collection: Round.all

      f.input :team_1, prompt: "Select Team", as: :select, collection: Game.teams
      f.input :team_1_score
      f.input :team_2, prompt: "Select Team", as: :select, collection: Game.teams
      f.input :team_2_score
      f.input :final
      f.input :lock_predictions
      f.input :schedule

    end
    f.actions

  end

  member_action :update_us_points, method: :put do
    game = Game.find(params[:id])
    game.user_scores.map do |us|
      us.update_points
      us.save!
    end
    redirect_to request.referer, notice: "User Points Updated"
  end

  member_action :final, method: :put do
     game = Game.find(params[:id])
     game.final = true
     game.save!
     redirect_to request.referer, notice: "Final"
  end

  action_item :only => :show do
    link_to 'Final', final_admin_game_path(game), method: :put
  end

  action_item :only => :show do
    link_to'Update User Points', update_us_points_admin_game_path(game), method: :put if game.final
  end

end
