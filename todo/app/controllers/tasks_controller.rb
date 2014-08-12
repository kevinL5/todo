class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    status
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.status = false
    @task.save
    flash[:alert] = "Your task was created"
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    flash[:alert] = "Your task was updated"
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:alert] = "Your task was deleted"
    redirect_to tasks_path
  end

  private

  def status
    @status = 'Not done'
    @status = 'Done :)' if @task.status == true
  end


  def task_params
    params.require(:task).permit(:name, :status)
  end

end
