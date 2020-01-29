module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def admin?
    unless logged_in? && current_user.adminrole
      # flash[:danger] = "you are not allowed to view that page."

      redirect_to all_tasks_path, notice: "you are not allowed to view that page."
    end
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to homepage_path
    end
  end
end
