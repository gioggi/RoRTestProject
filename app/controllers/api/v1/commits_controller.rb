class Api::V1::CommitsController < ApplicationController

  def create
    @commit = Commit.new(commit_params)
    begin @commit.save!
      render 'api/v1/commits/show'
    rescue  => e
      render :json => "#{e}"
    end
  end

  def update
    @commit = Commit.find(params[:id])
    begin @team.update!(commit_params)
      render 'api/v1/commits/show'
    rescue  => e
      render :json => "#{e}"
    end
  end

  def commit_params
    params.require(:commit).permit( :note, :worker_id, :task_id, :kind)
  end

end
