class ProjectsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    if current_user.projects.create(project_params)
      flash[:success] = "Project created!"
      redirect_to root_url
    else
      flash[:success] = "Project not created!"
      redirect_to root_url
    end
  end

  def destroy
    @project.destroy
    flash[:success] = "Project deleted"
    redirect_to request.referrer || root_url
  end

  def update
    @project = current_user.projects.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = "Project updated!"
      redirect_to root_url
    else
      flash[:success] = "Project not updated!"
      redirect_to root_url
    end
  end

  def show
    @feed_items = current_user.feed.paginate(page: params[:page]).reorder("project_due_date ASC")
    @project = current_user.projects.find(params[:id])
  end

    private

  def project_params
    params.require(:project).permit(:project_title, :project_subject, :project_type, :project_worth, :project_due_date, :project_details)
  end

  def correct_user
    @project = current_user.projects.find_by(id: params[:id])
    redirect_to root_url if @project.nil?
  end

end

# Need to update project Params