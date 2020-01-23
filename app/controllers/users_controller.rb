class UsersController < ApplicationController
  def new
    if logged_in?
      redirect_to all_tasks_path
    end
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #   render "new"
      redirect_to user_path(@user.id)
    else
      render "new"
    end
  end

  def show
    # @user = User.find(params[:id])
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :email, :password,
                                 :password_confirmation)
  end
end
