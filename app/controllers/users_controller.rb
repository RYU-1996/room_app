class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to users_profile_path
      else
        render :new
      end
  end
  
  def show
    @user = current_user
    @rooms = @user.rooms
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = current_user
    if @user.update(params.require(:user).permit(:name, :introduction, :image))
      flash[:notice] = "Profile was successfully updated."
      redirect_to edit_user_url
    else
      render :edit
    end
  end
  
  def login
    @user = User.new
    @user = User.find_by(email:params[:email] , password:params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to root_path
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
  
  def account
    @user = current_user
  end
  
  def profile
    @user = current_user
    @user = User.new
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end



