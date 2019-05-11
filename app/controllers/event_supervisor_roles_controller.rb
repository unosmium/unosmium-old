class EventSupervisorRolesController < ApplicationController
  def index
    if params[:tournament_id]
      @tournament = Tournament.find(params[:tournament_id])
      @event_supervisor_roles = @tournament.event_supervisor_roles
    else
      @event_supervisor_roles = EventSupervisorRole.all
    end
  end

  def show
    @event_supervisor_role = EventSupervisorRole.find(params[:id])
    @event_supervisor = User.find(@event_supervisor_role.user_id)
  end

  def new
    @event_supervisor_role = EventSupervisorRole.new
  end

  def create
    @event_supervisor_role = EventSupervisorRole.new(event_supervisor_params)
    tournament_id = params[:tournament_id]
    if @event_supervisor_role.save
      redirect_to tournament_event_supervisor_role_path(tournament_id, @event_supervisor_role.id)
    else
      redirect_to tournament_event_supervisor_roles_path(tournament_id)
    end
  end

  def destroy
    @event_supervisor_role = EventSupervisorRole.find(params[:id])
    tournament_id = @event_supervisor_role.tournament_id
    if @event_supervisor_role.destroy
      redirect_to tournament_event_supervisor_roles_path(tournament_id)
    else
      redirect_to touranment_event_supervisor_role(tournament_id, @event_supervisor.id)
    end
  end

  private

  def event_supervisor_params
    params.require(:event_supervisor_role).permit(:user_id, :tournament_id)
  end
end