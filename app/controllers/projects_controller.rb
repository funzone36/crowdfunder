class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    @project.rewards.build
  end

  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @project }
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def delete
    @project = Project.find(params[:id])

    @project.destroy
    redirect_to projects_path
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(project_params())
      redirect_to projects_path
    else
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :goal, :deadline, rewards_attributes: [:name, :description, :amount])
  end

end
