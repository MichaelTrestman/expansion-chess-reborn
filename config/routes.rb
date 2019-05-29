Rails.application.routes.draw do
  resources :games, only: [:index, :show, :new]

  defaults format: :json do
    match '/calculate_moves', to: MovesController.action(:calculate_moves), via: [:get]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
