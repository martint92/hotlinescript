Rails.application.routes.draw do

  root 'instructions#index'

  %w( 400 404 406 422 500 503 ).each do |code|
    get code, :to => "errors#show", :code => code 
  end 

  #SECTIONS PAGES
  get '/sections/list' => "sections#index", as: 'sections_index'
  get 'sections/:id/edit' => 'sections#edit', as: @section
  get '/fetch_sections' => 'sections#from_sections', as: 'fetch_sections'
  post "/sections" => "sections#create"
  patch "/sections" => "sections#update"

  #TOPIC PAGES
  get '/hotline' => 'topics#index'
  get '/from_nav/:id' => 'topics#from_nav', as: 'from_nav'

  #STATIC PAGES
  get '/maintenance' => 'static#maintenance'
  get '/error' => 'static#permission_error'
  get '/help' => 'static#help'
  get '/tracking' => 'static#tracking'

  #USER PAGES
  get '/user/list' => "users#index"
  get '/edit_permissions' => "users#edit_permissions", as: 'edit_permissions'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  #OFFICE 365 API
  get '/test-email' => 'guests#test_email'

  #REFERRAL PAGES
  get '/referrals' => 'referrals#index'
  get '/fetch_category' => 'referrals#fetch_category', as: 'fetch_category'
  get '/fetch_content' => 'referrals#fetch_content', as: 'fetch_content'

  resources :sections, :users, :emails, :guests, :instructions, :referrals, :reminders, :topics 
  resources :sessions, only: [:new, :create, :destroy]
  resources :acount_activations, only: [:edit]
  resources :hotlinks, only: [:new, :create, :destroy]
end

## TO DO
## MOVE MAILER OPTION TO SIDE BAR << CREATE POPUP << :require_user << templates edit require_editor, edit email require_user 

