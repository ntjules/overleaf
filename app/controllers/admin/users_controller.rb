class Admin::UsersController < ApplicationController
  before_action :admin?
  before_action :set_user, only: [:show, :edit, :update, :destroy, :makeadmin]

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
    if @user.email === "ntjules@gmail.com"
      redirect_to admin_users_path, notice: "this is a super user deletion not allowed"
    else
      @user.destroy
      redirect_to admin_users_path, notice: "User was successfully destroyed."
    end
    puts @user.email
  end

  def makeadmin
    if @user.email === "ntjules@gmail.com"
      redirect_to admin_users_path, notice: "this is a super user change not allowed"
    else
      # @user.update_attribute(:adminrole, [true | false])
      @role = @user.adminrole ? false : true
      @user.update_attribute(:adminrole, @role)
      redirect_to admin_users_path, notice: "access granted"
    end
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
