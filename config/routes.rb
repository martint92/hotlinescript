Rails.application.routes.draw do

  get 'sessions/new'

  resources :users
  resources :sessions
  resources :faqposts
  resources :acount_activations, only: [:edit]

  root 'faqpost#index'

  get '/home' => 'static#Home'
  get '/maintenance' => 'static#Maintenance'
  get '/permissionError' => 'static#Permissionerror'
  get '/contact' => 'static#Contact'
  get '/harveyfaqold' => 'static#HarveyFaq'
  get '/doesnotexist' => 'static#doesnotexist'
  get '/script/' => 'static#doesnotexist'
  get '/error' => 'static#PermissionError'

  get '/signup' => 'users#new'
  post '/user' => 'users#create'
  get '/user/list' => 'users#index'
  get '/user/:id/edit' => 'users#edit'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/faqposts' => 'faqposts#index'
  get '/faqposts/new' => 'faqposts#new'
  post '/faqposts/' => 'faqposts#create'
  get '/faqposts/:id/edit' => 'faqposts#edit', as: @faqpost
  post '/faqposts' => 'faqposts#update'

end
