class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  before_action :total_projects
  before_action :projects_today
  before_action :total_users
  before_action :users_today
  before_action :total_groups
  before_action :groups_today

  private

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end


  def total_projects
    @total_projects = Project.all.size
  end

  def projects_today
    @projects_today = Project.where(created_at: (Time.now - 24.hours)..Time.now).count
  end

  def total_users
    @total_users = User.all.size
  end

  def users_today
    @users_today = User.where(created_at: (Time.now - 24.hours)..Time.now).count
  end

  def total_groups
    @total_groups= Group.all.size
  end

  def groups_today
    @groups_today = Group.where(created_at: (Time.now - 24.hours)..Time.now).count
  end

  def total_colleges
    @total_users = User.all.size
  end

  def colleges_today
    @users_today = User.where(created_at: (Time.now - 24.hours)..Time.now).count
  end


end