class TimetablesController < ApplicationController

  def index
    @timetables = Timetable.all
  end

  def new
    @timetable = Timetable.new
  end

  def create
    @timetable = Timetable.new(timetable_params)
    @timetable.user_id = current_user.id

    if @timetable.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @timetable = Timetable.find(params[:id])
    @timetable.destroy
    redirect_to root_path, notice:  "The timetable #{@timetable.name} has been deleted."
  end

  private
  def timetable_params
    params.require(:timetable).permit(:name, :attachment)
  end

  def correct_user
    @project = current_user.projects.find_by(id: params[:id])
    redirect_to root_url if @project.nil?
  end
end