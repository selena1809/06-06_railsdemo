class ApplicationController < ActionController::Base
   def check_user_logged_in
    if session[:user_token] == nil
      redirect_to sessions_sign_in_path
    else
      @current_user = User.find_by(token: session[:user_token])
    end
  end
end
