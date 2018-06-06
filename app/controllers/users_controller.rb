class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_user_logged_in, only: [:show]
 
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def show
  end
  
  def set_user
    @user = User.find(params[:id])
  end

  private def user_params
    params.require(:user).permit(:email, :name, :password)
  end
end
