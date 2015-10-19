class StaticPagesController < ApplicationController
  def home
  end

  def help
  end
  
  def about
     flash[:notice] = "Testing the flash"
  end

end
