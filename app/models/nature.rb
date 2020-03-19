class Nature < ApplicationRecord
    has_many :pokemon_natures, dependent: :destroy 
    has_many :pokemons, through: :pokemon_natures
end
