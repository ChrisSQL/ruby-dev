class Api::V1::ProjectsController < Api::V1::BaseController
  before_filter :authenticate_user!

  def index

    # ember optimization
    # we could have another point for the feed but then we would have some projects
    # 2 times in browser's memory
    if params[:feed]
      return api_error(status: 422) if params[:feed_user_id].blank?
      return unauthorized! unless current_user.id == params[:feed_user_id].to_i

      projects = User.find_by(id: params[:feed_user_id]).feed
    else
      projects = Project.where(user_id: params[:user_id])
    end

    projects = apply_filters(projects, params)

    projects = paginate(projects)

    projects = policy_scope(projects)

    render(
        json: ActiveModel::ArraySerializer.new(
            projects,
            each_serializer: Api::V1::ProjectSerializer,
            root: 'projects',
            meta: meta_attributes(projects)
        )
    )
  end

  def show
    project = Project.find(params[:id])
    authorize project

    render json: Api::V1::ProjectSerializer.new(project).to_json
  end

  def create
    project = Project.new(create_params)
    return api_error(status: 422, errors: project.errors) unless project.valid?

    project.save!

    render(
        json: Api::V1::ProjectSerializer.new(project).to_json,
        status: 201,
        location: api_v1_project_path(project.id),
        serializer: Api::V1::ProjectSerializer
    )
  end

  def update
    project = Project.find(params[:id])

    authorize project

    if !project.update_attributes(update_params)
      return api_error(status: 422, errors: project.errors)
    end

    render(
        json: Api::V1::ProjectSerializer.new(project).to_json,
        status: 200,
        location: api_v1_project_path(project.id),
        serializer: Api::V1::ProjectSerializer
    )
  end

  def destroy
    project = Project.find(params[:id])

    authorize project

    if !project.destroy
      return api_error(status: 500)
    end

    head status: 204
  end

  private

  def create_params
    params.require(:project).permit(
        :content, :picture, :user_id
    )
  end

  def update_params
    create_params
  end
end