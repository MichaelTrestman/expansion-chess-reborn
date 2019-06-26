Rails.application.routes.draw do

  match '/', to: GamesController.action(:index), via: [:get]

  resources :games, only: [:index, :show, :new, :create]

  get 'login' => 'sessions#new'
  post 'sessions' => 'sessions#create'
  get 'signup' => 'users#new'
  post 'users' => 'users#create'


  defaults format: :json do

    match '/calculate_moves', to: MovesController.action(:calculate_moves), via: [:get]

    match '/ai_move', to: MovesController.action(:ai_move), via: [:get]

    match '/submit_move', to: MovesController.action(:submit_move), via: [:post]

    match '/take_back_last_move', to: MovesController.action(:take_back_last_move), via: [:post]

    match '/mongo_data', to: GamesController.action(:mongo_data), via: [:get]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
