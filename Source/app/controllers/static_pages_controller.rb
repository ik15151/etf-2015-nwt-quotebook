class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @quote  = current_user.quotes.build      
      @quotes2 = Quote.all
      # @feed_items = current_user.feed.paginate(page: params[:page])
      if params[:tag]
        @feed_items = current_user.feed_tags(params[:tag]).paginate(page: params[:page])
      else
        @feed_items = current_user.feed.paginate(page: params[:page])
      end
      
      respond_to do |format|
        format.html
        format.csv do
          headers['Content-Disposition'] = "attachment; filename=\"quote-list\""
          headers['Content-Type'] ||= 'text/csv'
        end
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