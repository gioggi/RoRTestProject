class Api::V1::WorkersController < ApplicationController

  def index
    @workers = Worker.all
  end

  def create
    @worker = Worker.new(project_params)
    begin @worker.save!
      render 'api/v1/workers/show'
    rescue  => e
      render :json => "#{e}"
    end
  end

  def project_params
    params.require(:worker).permit(:name, :email, :role, :team_id)
  end
end
