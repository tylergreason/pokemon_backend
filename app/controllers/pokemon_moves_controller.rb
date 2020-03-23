class PokemonMovesController < ApplicationController
    belongs_to :pokemon 
    belongs_to :move
end
