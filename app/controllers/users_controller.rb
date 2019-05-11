class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  ## will throw uncaught error b/c email validations
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      redirect_to new_user_path
    end
  end

  # will throw exceptions b/c remaining associations
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_path
    else
      redirect_to user_path(@user.id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end