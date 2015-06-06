class QuotesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @quote = current_user.quotes.build(quote_params)
    if @quote.save
      flash[:success] = "Quote created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def quote_params
      params.require(:quote).permit(:content)
    end
end
