class Api::V1::TasksController < ApplicationController

  def index
    @tasks = Task.search_by_parms(index_tasks_params[:worker_id], index_tasks_params[:status])
  end

  def create
    @task = Task.new(tasks_params)
    begin @task.save!
      render 'api/v1/tasks/show'
    rescue  => e
      render :json => "#{e}"
    end
  end

  def update
    @task = Task.find(params[:id])
    begin @task.update!(tasks_params)
      render 'api/v1/tasks/show'
    rescue  => e
      render :json => "#{e}"
    end
  end

  def tasks_params
    params.require(:task).permit( :status, :description, :deadline, :project_id,  worker_ids: [])
  end

  def index_tasks_params
    params.permit(:status, :worker_id)
  end

end
