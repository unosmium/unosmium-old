class AdminRolesController < ApplicationController
  def index
    if params[:tournament_id]
      @tournament = Tournament.find(params[:tournament_id])
      @admin_roles = @tournament.admin_roles
    else
      @admin_roles = AdminRole.all
    end
  end

  def show
    @admin_role = AdminRole.find(params[:id])
    @admin = User.find(@admin_role.user_id)
  end

  def new
    @admin_role = AdminRole.new
  end

  def create
    @admin_role = AdminRole.new(admin_role_params)
    @tournament = params[:tournament_id]
    if @admin_role.save
      redirect_to tournament_admin_role_path(@tournament, @admin_role)
    else
      redirect_to tournament_admin_roles_path
    end
  end

  def destroy
    @admin_role = AdminRole.find(params[:id])
    tournament_id = @admin_role.tournament_id
    if @admin_role.destroy
      redirect_to tournament_admin_roles_path(tournament_id)
    else
      redirect_to touranment_admin_role(tournament_id, @admin_role.id)
    end
  end

  private

  def admin_role_params
    params.require(:admin_role).permit(:user_id, :tournament_id)
  end
end
