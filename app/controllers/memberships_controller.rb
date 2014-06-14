class MembershipsController < ApplicationController
  def new
    @league = League.find(params[:league_id])
    @membership = League.new
  end

  def create
    league = League.find(params[:league_id])
    @membership = Membership.find_by(league: league, user: current_user)
    if @membership
      flash[:alert] = "You already belong to #{league.name}"
    else
      @membership = Membership.create(league: league, user: current_user)
      flash[:notice] = "You have joined #{league.name}"
    end
    redirect_to leagues_path
  end
end
