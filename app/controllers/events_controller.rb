class EventsController < ApplicationController
  def index
    if params[:tournament_id]
      @tournament = Tournament.find(params[:tournament_id])
      @events = @tournament.events
    else
      @events = Event.all
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.tournament_id = params[:tournament_id]
    if @event.save
      redirect_to tournament_event_path(@event.tournament_id, @event.id)
    else
      redirect_to tournament_events_path
    end
  end

  def destroy
    @event = Event.find(params[:id])
    tournament_id = @event.tournament_id
    if @event.destroy
      redirect_to tournament_events_path(tournament_id)
    else
      redirect_to touranment_event(tournament_id, @event.id)
    end
  end

  # two pathways: either tournaments get finalized and no teams can be added
  # or we make this more versatile and dynamically update scores
  def assign_scores
    @event = Event.find(params[:id])
    @event.scores = init_scores @event if @event.scores.empty?
    @scores = @event.scores
  end

  private

  def event_params
    params.require(:event).permit(:name, :scoring, :trial)
  end

  def init_scores(event)
    blank_scores = []
    event.tournament.teams.each do |team|
      new_score = Score.new
      new_score.team_id = team.id
      new_score.event_id = event.id
      blank_scores << new_score
    end
    blank_scores
  end
end
