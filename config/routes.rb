Rails.application.routes.draw do


# ============= normal controller =============
  resources :tickets
  resources :events
  resources :speakers
  resources :users
  resources :charges

  get '/' => 'homes#index'


  #============ api controller ================
  namespace :api do
    resources :tickets
    resources :events
    resources :speakers
    resources :users
  end

  get '/login' => 'sessions#loginpage'
  post '/login' => 'sessions#login'
  get '/logout' => 'sessions#logout'
  # delete '/logout' => 'sessions#logout'
  post '/apply' => 'users#apply'
end
