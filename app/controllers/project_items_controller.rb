class ProjectItemsController < ApplicationController
  before_action :get_project

  def new
    @item = @project.items.new
  end
  
  def create
    @item = @project.items.new(item_params)

    if @item.save
      flash[:success] = "Create project item successfully"
      redirect_to @project
    else
      render template: "projects/show"
    end
  end

  def update
    # TODO
  end

  def destroy
    # TODO
  end

  private

  def item_params
    params.
      require(:project_item).
      permit(
        %i(position excerpt),
        images_attributes: %i(item_photo)
      )
  end

  def get_project
    @project = Project.find(params[:project_id])
  end
end
