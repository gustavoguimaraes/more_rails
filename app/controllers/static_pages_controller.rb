class StaticPagesController < ApplicationController
  def landing
    redirect_to user_path(current_user) if current_user
  end

  def gameboard
  end

  def about
  end

  def help
  end

  def contact
  end
end
