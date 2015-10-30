class TimetablesController < ApplicationController

  def index
    @timetables = Timetable.all
  end

  def new
    @timetable = Timetable.new
  end

  def create
    @timetable = Timetable.new(timetable_params)

    if @timetable.save
      redirect_to timetable_path, notice: "The timetable #{@timetable.name} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @timetable = Timetable.find(params[:id])
    @timetable.destroy
    redirect_to timetables_path, notice:  "The timetable #{@timetable.name} has been deleted."
  end

  private
  def timetable_params
    params.require(:timetable).permit(:name, :attachment)
  end
end