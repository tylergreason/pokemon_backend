class Pokemon < ApplicationRecord
    has_many :pokemon_types, dependent: :destroy
    has_many :types, through: :pokemon_types
    has_many :user_pokemons, dependent: :destroy 
    has_many :users, through: :user_pokemons
end
