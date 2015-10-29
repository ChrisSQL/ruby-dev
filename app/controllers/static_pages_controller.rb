class StaticPagesController < ApplicationController
  def home
    if logged_in?
    @project = current_user.projects.build if logged_in?
    @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end
  
  def about
     flash[:notice] = "Testing the flash"
  end



end
