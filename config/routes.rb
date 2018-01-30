Rails.application.routes.draw do

  root 'static#home'

  %w( 404 406 422 500 503 ).each do |code|
    get code, :to => "errors#show", :code => code 
  end 

  #SECTIONS PAGES
  get '/section/' => "sections#index", as: "sections/index"
  get 'sections/new'
  get 'sections/index'
  get '/section/:id' => 'sections#show'
  get 'sections/:id/edit' => 'sections#edit', as: @section
  get '/fetch_sections' => 'sections#from_sections', as: 'fetch_sections'
  get '/link_sections' => 'sections#from_link', as: 'fetch_sections_by_link'

  #STATIC PAGES
  get '/maintenance' => 'static#maintenance'
  get '/permissionError' => 'static#permission_error'
  get '/contact' => 'static#contact'
  get '/harveyfaqold' => 'static#harvey_faq'
  get '/doesnotexist' => 'static#doesnotexist'
  get '/error' => 'static#permission_error'
  # Home is having super strange template errors 406 in production, but works 
  # locally. For now, switching home page to contact.html.erb as a quickfix.
  get '/home' => 'static#home'
  get '/help' => 'static#help'

  #USER PAGES
  get '/signup' => 'users#new'
  post '/user' => 'users#create'
  get '/user/list' => 'users#index'
  get '/user/:id/edit' => 'users#edit'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  #HARVEY FAQ  // DEPRICIATED // CODE USEFUL FOR REFERENCE
  get '/faqposts' => 'faqposts#index'
  get '/faqposts/new' => 'faqposts#new'
  post '/faqposts/' => 'faqposts#create'
  get '/faqposts/:id/edit' => 'faqposts#edit', as: @faqpost
  post '/faqposts' => 'faqposts#update'

  resources :users, :sessions, :faqposts, :sections, :static
  resources :acount_activations, only: [:edit]
end
