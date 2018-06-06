class SessionsController < ApplicationController
  before_action :check_user_logged_in, only: [:show]
  def check_user_logged_in
    if session[:user_token] == nil
      redirect_to sessions_sign_in_path
    else
      redirect_to users_path
    end
  end

  def sign_in
    @user = User.new
  end

  def login
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.password == params[:user][:password]
      session[:user_token] = @user.token
      session[:user_email] = @user.email
      flash[:success] = "User logged in successfully!"
      redirect_to users_path
    else
      redirect_to sessions_sign_in_path
    end
  end

  def logout
    session[:user_token] = nil
    session[:user_email] = nil
    redirect_to users_path
  end
end
