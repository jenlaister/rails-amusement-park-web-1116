Rails.application.routes.draw do

  get '/', to: 'application#root', as: 'root'
  resources :users, only: [:new, :create, :show, :index]
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  resources :attractions
  post '/attractions/:id', to: 'attractions#takeride', as: 'takeride'

end
