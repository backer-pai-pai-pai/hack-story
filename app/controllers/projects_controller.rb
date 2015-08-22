class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: %i(new create edit update destroy)
  before_action :get_project, only: %i(show edit update)

  def index
  end

  def new
    @project = Project.new
  end

  def show
    @item = @project.items.new
  end

  def create
    @project = Project.new(project_params)
    @project.owner = current_user

    if @project.save
      flash[:success] = "Create project successfully."
      redirect_to @project
    else
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(%i(title description address lat ing))
  end

  def get_project
    @project = Project.find(params[:id])
  end
end
