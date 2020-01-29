class Admin::UsersController < ApplicationController
  before_action :logged_in_user
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all.order("id desc")
    @alltasks = Task.count
    @allusers = User.count
    @inprogress = Task.where(status: "inprogress").count
    @done = Task.all.where(status: "done").count
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "User was successfully created."
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "user was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: "User was successfully destroyed."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,
                                 :password_confirmation)
  end
end
