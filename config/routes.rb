Rails.application.routes.draw do
  resources :pokemon_abilities
  resources :abilities
  resources :pokemon_natures
  resources :natures
  resources :user_pokemons
  resources :users
  resources :pokemon_types
  resources :types
  resources :pokemons
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
