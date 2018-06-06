Rails.application.routes.draw do
 resources :users

 # get '/session/check_user_logged_in', to: 'session#check_user_logged_in'
  get '/sessions/sign_in', to: 'sessions#sign_in'
    post '/sessions/login', to: 'sessions#login'
    get '/sessions/logout', to: 'sessions#logout'
end
