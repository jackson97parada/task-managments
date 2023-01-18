class TasksController < ApplicationController

  def index
    @tasks = 
    FindTasks.new.call(params).page(params[:page]).per(params[:per_page])
    render json: serializer(@tasks)
  end

  def show
    render json: serializer(task)
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      render json: serializer(@task), status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    if task.update(task_params)
      render json: serializer(task)
    else
      render json: task.errors, status: :unprocessable_entity
    end
  end

  def update_enabled
    if task.update(status: !task.status)
      render json: serializer(task)
    end
  end

  def destroy
    task.destroy 
  end

  private

  def task_params
    params.require(:task).permit(
      :title, 
      :description, 
      :start_date, 
      :end_date, 
      :tag_id,
      employees_attributes: [:id])
  end

  def task
    Task.find(params[:id])
  end

  def serializer(object)
    TaskSerializer.new(object).serializable_hash.to_json
  end

end
