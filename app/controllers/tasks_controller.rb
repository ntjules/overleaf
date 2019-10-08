class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def tasks
    # @tasks = Task.all
    @tasks = Task.all.recent

    # @tasks = Task.all.order(created_at: :desc)

    # if params[:order] == "date desc"
    #   @tasks = Task.all.order(created_at: :desc)
    # elsif params[:order] == "date asc"
    #   @tasks = Task.all.order(created_at: :asc)
    # else
    #   @tasks = Task.all
    # end
  end

  def create
    @task = Task.new(task_params)

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
    params.require(:task).permit(:title, :content, :deadline)
  end
end
