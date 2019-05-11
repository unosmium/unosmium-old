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

  private

  def event_params
    params.require(:event).permit(:name, :scoring, :trial)
  end
end