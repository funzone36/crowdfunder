class PledgesController < ApplicationController

  def index
    @pledges = Pledge.all
  end

  def new
    @pledge = Pledge.new

    @project = Project.find(pledges_params[:project_id])
  end

  def show
    @pledge = Pledge.find(params[:id])
  end

  def create
    @pledge = Pledge.new(pledges_params)

    if @pledge.save
      redirect_to new_project_pledge_path
    else
      render :new
    end
  end

  private

  def pledges_params
    params.permit(:amount, :project_id)
  end

end
