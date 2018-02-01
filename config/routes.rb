Rails.application.routes.draw do

  root 'static#home'

  %w( 404 406 422 500 503 ).each do |code|
    get code, :to => "errors#show", :code => code 
  end 

  #SECTIONS PAGES
  get '/sections/list' => "sections#index", as: 'sections_index'
  get 'sections/:id/edit' => 'sections#edit', as: @section
  get '/fetch_sections' => 'sections#from_sections', as: 'fetch_sections'
  post "/sections" => "sections#create"
  patch "/sections" => "sections#update"

  #STATIC PAGES
  get '/maintenance' => 'static#maintenance'
  get '/error' => 'static#permission_error'
  get '/help' => 'static#help'

  #USER PAGES
  get '/user/list' => "users#index"
  get '/edit_permissions' => "users#edit_permissions", as: 'edit_permissions'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :sections, :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :acount_activations, only: [:edit]
  resources :hotlinks, only: [:new, :create, :destroy]
end
