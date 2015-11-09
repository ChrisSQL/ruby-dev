class StaticPagesController < ApplicationController

  def home

    if logged_in?
      @project = current_user.projects.build if logged_in?
      @timetable = current_user.timetables.build if logged_in?
      @feed_items = current_user.feed.paginate(page: params[:page]).reorder("project_due_date ASC")
      @feed_items3 = current_user.feed3.paginate(page: params[:page], :per_page => 1)
    end
  end

  def timetable

    if logged_in?

      @project = current_user.projects.build if logged_in?
      @feed_items = current_user.feed.paginate(page: params[:page]).reorder("project_due_date ASC")
    end
  end


  def show
    @user = User.find(params[:id])

  end

  def help
  end

  def about
    flash[:notice] = "Testing the flash"
  end




end
