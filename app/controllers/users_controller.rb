class UsersController < ApplicationController
  before_filter :update_total_points, only: [:show]

  def show
    # maybe move this to a dashboard controller later
    set_user
    @memberships = @user.memberships
    @user_scores = @user.user_scores
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation, :remember_me)
  end

  def update_total_points
    set_user
    return if @user != current_user
    return 0 if current_user.user_scores.empty?
    @all_points = current_user.user_scores.map { |us| us.points }
    current_user.update_attributes(total_points: @all_points.sum)
  end
end
