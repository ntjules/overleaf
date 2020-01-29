class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to all_tasks_path
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      # redirect_to user_path(user.id)
      redirect_to all_tasks_path, notice: "succefully loged in"
    else
      flash[:danger] = "Failed to login"
      redirect_to homepage_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "You logged out"
    redirect_to homepage_path
  end
end
