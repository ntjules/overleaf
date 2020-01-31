class TasksController < ApplicationController
  before_action :logged_in_user
  before_action :set_task, only: [:show, :edit, :update, :destroy, :stop_stask, :restart_stask, :done_stask, :start_stask]

  # def index
  #     end

  def tasks

    # @tasks = Task.all
    # @tasks = Task.all.recent

    # @tasks = Task.all.order(created_at: :desc)
    @search = current_user.tasks.includes([:taggings]).recent.ransack(params[:q])

    if params[:order] == "date_desc"
      @search.sorts = "deadline desc" if @search.sorts.empty?
      @tasks = @search.result.page params[:page]
    elsif params[:order] == "date_asc"
      @search.sorts = "deadline asc" if @search.sorts.empty?
      @tasks = @search.result.page params[:page]
    elsif params[:order] == "hpri"
      @search.sorts = "priority desc" if @search.sorts.empty?
      @tasks = @search.result.page params[:page]
    elsif params[:order] == "pr_high"
      @search = current_user.tasks.includes([:taggings]).recent.high.ransack(params[:q])

      @tasks = @search.result.page params[:page]
    elsif params[:order] == "pr_med"
      @search = current_user.tasks.includes([:taggings]).recent.medium.ransack(params[:q])
      @tasks = @search.result.page params[:page]
    elsif params[:order] == "pr_low"
      @search = current_user.tasks.includes([:taggings]).recent.low.ransack(params[:q])
      @tasks = @search.result.page params[:page]
    else
      # @search = Task.ransack(params[:q])
      # @tasks = @search.result
      # @search.build_condition
      # @tasks = @search.result.paginate(page: params[:page], per_page: 2)
      @tasks = @search.result.includes([:taggings]).page params[:page]

      # @tasks = @search.result(distinct: true)
    end

    # if params.has_key?(:sort_param)
    #   @tasks = Task.all.recent.order("#{params[:sort_param]}")
    # end

    # @tasks = Task.all.recent
  end

  def create
    # @task = Task.new(task_params)
    # # @user = User.find(1)
    # @task.user = current_user
    @task = current_user.tasks.build(task_params)

    if @task.save
      redirect_to all_tasks_path, notice: "Task was successfully created."
    else
      render "new"
    end
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def stop_stask
    @task.stop!
    redirect_to all_tasks_path, notice: "Task Stoped."
  end

  def restart_stask
    @task.restart!
    redirect_to all_tasks_path, notice: "Task Restarted"
  end

  def done_stask
    @task.done!
    redirect_to all_tasks_path, notice: "Task Restarted"
  end

  def start_stask
    @task.start!
    redirect_to all_tasks_path, notice: "Task Restarted"
  end

  def show
  end

  def update
    if @task.update(task_params)
      redirect_to all_tasks_path, notice: "Task was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to all_tasks_path, notice: "Task was successfully destroyed."
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :deadline, :priority, :tag_list => [])
  end
end
