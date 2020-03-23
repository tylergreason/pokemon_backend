class NaturesController < ApplicationController
    has_many :pokemon_natures, dependent: :destroy 
    has_many :pokemons, through: :pokemon_nature
end
