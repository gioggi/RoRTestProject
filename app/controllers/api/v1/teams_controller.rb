class Api::V1::TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def create
    @team = Team.new(teams_params)
    begin @team.save!
      render 'api/v1/teams/show'
    rescue  => e
      render :json => "#{e}"
    end
  end

  def update
    @team = Team.find(params[:id])
    begin @team.update!(teams_params)
      render 'api/v1/teams/show'
    rescue  => e
      render :json => "#{e}"
    end
  end

  def teams_params
    params.require(:team).permit( :name,  worker_ids: [])
  end

end
