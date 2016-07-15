class PledgesController < ApplicationController
  before_action :authenticate_user, :except => [:index, :show]

  def index
    @project = Project.find(params[:project_id])
    @pledges = @project.pledges.all

    respond_to do |format|
      format.html
      format.json { render json: @pledges}
    end
  end

  def new
    @project = Project.find(params[:project_id])
    @pledge = @project.pledges.build

    respond_to do |format|
      format.html
      format.json { render json: @pledge}
    end
  end

  def show
    @project = Project.find(params[:project_id])
    @pledge = Pledge.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @pledge}
    end
  end

  def create
    @project = Project.find(params[:project_id])
    @pledge = @project.pledges.build(pledges_params)
    @pledge.user = current_user

    if @pledge.save
      respond_to do |format|
        format.html do
          redirect_to project_path(@project)
        end
        format.json { render json: @pledge}
      end
    else
      render :new
    end
  end

  private

  def pledges_params

    params.permit(:amount, :project_id)
  end

end
