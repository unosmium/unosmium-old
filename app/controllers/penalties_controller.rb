class PenaltiesController < ApplicationController
  def create
    @penalty = Penalty.new(penalty_params)
    if @penalty.save!
      redirect_to tournament_team_path(params[:tournament_id], @penalty.team_id)
    else
    end
  end

  def update
  end

  def destroy
    @penalty = Penalty.find(params[:id])
    if @penalty.destroy
    else
    end
    redirect_to tournament_team_path(params[:tournament_id], @penalty.team_id)
  end

  private

  def penalty_params
    params.require(:penalty).permit(:points, :team_id)
  end
end
