class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_params)
    @task.save
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def show
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end


end