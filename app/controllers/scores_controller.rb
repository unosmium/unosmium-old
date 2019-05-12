class ScoresController < ApplicationController
  def create
    @score = Score.new(score_params)
    @score.save!
  end

  def update
    print params
    @score = Score.find(params[:id])
    if @score.update_attributes(score_params)
    else
    end
  end

  def destroy
  end

  private

  def score_params
    params.require(:score).permit(:event_id, :team_id, :participated, :disqualified, :score, :tier, :tiebreaker_place)
  end
end