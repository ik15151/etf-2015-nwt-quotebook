class QuotesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @quote = current_user.quotes.build(quote_params)
    if @quote.save
      flash[:success] = "Quote created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
  
  def edit
    @quote = Quote.find(params[:id])
  end
  
  def update
    @quote = Quote.find(params[:id])
    if @quote.update_attributes(user_params)
      flash[:success] = "Quote updated"
      redirect_to @quote
    else
      render 'edit'
    end
  end

  def destroy
    @quote.destroy
    flash[:success] = "Quote deleted."
    redirect_to request.referrer || root_url
  end

  private

    def quote_params
      params.require(:quote).permit(:content, :source, :comment)
    end
    
    def correct_user
      @quote = current_user.quotes.find_by(id: params[:id])
      redirect_to root_url if @quote.nil?
    end
end