class LeaguesController < ApplicationController
  def new
    @league = League.new
  end

  def create
    @league= League.create(league_params)
    redirect_to leagues_path
  end

  def update
  end

  def show
    @league = League.find(params[:id])
    @members = @league.memberships.all
  end

  def index
    @leagues = League.all
  end

  def rank_league_memberships
    rank_memberships
    redirect_to leagues_path, notice: "updated ranks"
  end

  private

    def league_params
      params.require(:league).permit(:name, :location)
    end


    def rank_memberships
      League.all.each do |league|
        Membership.rank_members(league)
      end
    end

end
