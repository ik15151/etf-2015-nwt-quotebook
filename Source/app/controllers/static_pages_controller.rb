class StaticPagesController < ApplicationController
  def home
    @quote = current_user.quotes.build if logged_in?
    @feed_items = current_user.feed.paginate(page: params[:page])
  end

  def help
  end
  
  def about
  end
  
  def contact
  end 
end