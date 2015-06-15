class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @quote  = current_user.quotes.build
      # @feed_items = current_user.feed.paginate(page: params[:page])
      if params[:tag]
        @feed_items = current_user.feed_tags(params[:tag]).paginate(page: params[:page])
      else
        @feed_items = current_user.feed.paginate(page: params[:page])
      end
    end
  end

  def help
  end
  
  def about
  end
  
  def contact
  end 
end