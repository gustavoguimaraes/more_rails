ActiveAdmin.register User do


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :overall_rank, :total_points

  # member_action :update_points_and_rank, :method => :put do
  #   map { |user| user.update_total_points }
  #   redirect_to root_path, notice: "User Points Updated"
  # end

  #  # batch_action :flag do |selection|
  #  #    Post.find(selection).each do |post|
  #  #      post.flag! :hot
  #  #    end
  #  #  end

  batch_action :update_points do
    User.all.each do |user|
      @scores = user.user_scores.map { |user_score| user_score.points }
      user.update_attributes(total_points: @scores.sum)
    end
    redirect_to admin_users_path, notice: "User Points Updated"
  end

  batch_action :rank_overall_users do
    User.all.each_with_index do |user, index|
      user.update_attributes(overall_rank: index+1)
    end
    redirect_to admin_users_path, notice: "Overall ranks updated"
  end


  # action_item :only => :index do
  #   link_to 'Update Points/Rank', update_points_and_rank_admin_users_path, method: :put
  # end

    # collection_action :rank_users, :method => :post do
    #   User.rank_users
    # end
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

end
