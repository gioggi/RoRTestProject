class Api::V1::ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def create
    @project = Project.new(project_params)
    begin @project.save!
      render 'api/v1/projects/show'
    rescue  => e
      render :json => "#{e}"
    end
  end

  def project_params
    params.require(:project).permit(:name, :worker_id)
  end

end
