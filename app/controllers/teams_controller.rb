class TeamsController < ApplicationController
  def index
    if params[:tournament_id]
      @tournament = Tournament.find(params[:tournament_id])
      @teams = @tournament.teams
    else
      @teams = Teams.all
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.tournament_id = params[:tournament_id]
    if @team.save!
        redirect_to tournament_teams_path
      else
        redirect_to tournament_team(@team.id)
      end
  end

  def destroy
    @team = Team.find(params[:id])
    tournament_id = @team.tournament_id
    if @team.destroy
      redirect_to tournament_teams_path(tournament_id)
    else
      redirect_to touranment_team(tournament_id, @team.id)
    end
  end

  private 

  def team_params
    params.require(:team).permit(:school, :suffix, :number, :city, :state, :subdivision)
  end
end