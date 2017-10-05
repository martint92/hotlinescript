Rails.application.routes.draw do

  get 'sessions/new'

  resources :users
  resources :sessions
  resources :faqposts

  root 'static#Maintenance'

  get '/home' => 'static#Home'
  get '/maintenance' => 'static#Maintenance'
  get '/permissionError' => 'static#Permissionerror'
  get '/contact' => 'static#Contact'
  get '/harveyfaqold' => 'static#HarveyFaq'
  get '/doesnotexist' => 'static#doesnotexist'
  get '/script/' => 'static#doesnotexist'
  get '/error' => 'static#permissionerror'

  get '/signup' => 'users#new'
  post '/user' => 'users#create'
  get '/user/list' => 'users#index'
  get '/user/:id/edit' => 'users#edit'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/harveyfaq' => 'faqposts#index'
  get '/harveyfaq/new' => 'faqposts#new'
  get '/harveyfaq/edit' => 'faqposts#edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
