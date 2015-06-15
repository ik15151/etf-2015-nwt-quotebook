class UsersController < ApplicationController  
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy,
                                        :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  
  def index
    # Umjesto @users = User.all 
    @users = User.paginate(page: params[:page])
    @users2 = User.all
    
    # Podaci o userima za chart
    @niz1 = []   
    
    @users.each do |user|
      @niz1.push({"ime"=>user.name , "broj"=>user.quotes.count})
    end
    
    if @niz1.length >= 3
      @niz1.sort_by! { |k| k["broj"] }.reverse!
      
      @userPrvoIme = @niz1[0]["ime"]
      @userPrviBroj = @niz1[0]["broj"]
      
      @userDrugoIme = @niz1[1]["ime"]
      @userDrugiBroj = @niz1[1]["broj"]
      
      @userTreceIme = @niz1[2]["ime"]
      @userTreciBroj = @niz1[2]["broj"]
    end
    
    # Podaci o autorima za chart
    @authors = Author.all
    
    @niz2 = []   
    
    @authors.each do |author|
      @niz2.push({"ime"=>author.name , "broj"=>author.quotes.count})
    end    
    
    if @niz2.length >= 3
      @niz2.sort_by! { |k| k["broj"] }.reverse!

      @authorPrvoIme = @niz2[0]["ime"]
      @authorPrviBroj = @niz2[0]["broj"]
      
      @authorDrugoIme = @niz2[1]["ime"]
      @authorDrugiBroj = @niz2[1]["broj"]
      
      @authorTreceIme = @niz2[2]["ime"]
      @authorTreciBroj = @niz2[2]["broj"]
    end
    
    respond_to do |format|
    format.html
    format.csv do
      headers['Content-Disposition'] = "attachment; filename=\"user-list\""
      headers['Content-Type'] ||= 'text/csv'
    end
  end
    
  end

  def show
    @user = User.find(params[:id])
    @quotes = @user.quotes.paginate(page: params[:page])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end
  
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end