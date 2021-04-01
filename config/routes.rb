
Rails.application.routes.draw do

  # I've created a gif controller so I have a page I can secure later. 
  # This is optional (as is the root to: above).
  get '/cool' => 'gif#cool'
  get '/sweet' => 'gif#sweet'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  root to: 'products#index'
  resources :about, only: [:index]
  resources :products, only: [:index, :show]
  resources :categories, only: [:show]
  

  resource :cart, only: [:show] do
    post   :add_item
    post   :remove_item
  end

  resources :orders, only: [:create, :show]

  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, only: [:index, :new, :create]
  end

  
end
