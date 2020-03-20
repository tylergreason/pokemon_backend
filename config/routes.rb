Rails.application.routes.draw do
  resources :pokemon_moves
  resources :moves
  resources :pokemon_abilities
  resources :abilities
  resources :pokemon_natures
  resources :natures
  resources :user_pokemons
  resources :users
  resources :pokemon_types
  resources :types
  resources :pokemons


  # custom routes 
  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
