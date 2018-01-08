Rails.application.routes.draw do

  root 'bands#index'
  
  get 'sessions/new'

  post 'sessions/create'

  delete 'sessions/destroy'

  get 'users/new', to: 'users#new'
  post 'users/create', to: 'users#create'

  resources :bands do 
    resources :albums, only: [:new]
    resources :tracks, only: [:new]
  end

  resources :albums, except: [:new, :index]
  resources :tracks, except: [:new, :index]

end
