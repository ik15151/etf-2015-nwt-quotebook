class AuthorsController < ApplicationController
  before_action :logged_in_user
  #before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  
  def index
    # Umjesto @authors = Author.all 
    @authors = Author.paginate(page: params[:page])
  end

  def show
    @author = Author.find(params[:id])
    @quotes = @author.quotes.paginate(page: params[:page])
  end
  
  def new
    @author = Author.new
  end
  
  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:success] = "Author saved."
      redirect_to authors_path
    else
      render 'new'
    end
  end
  
  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update_attributes(author_params)
      flash[:success] = "Author updated."
      redirect_to @author
    else
      render 'edit'
    end
  end
  
  def destroy    
    Author.find(params[:id]).destroy
    flash[:success] = "Author deleted."
    redirect_to authors_url
  end
  
 
  private
  
    def author_params
      params.require(:author).permit(:name, :biography)
    end 
    
    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
