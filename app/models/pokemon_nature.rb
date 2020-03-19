class PokemonNature < ApplicationRecord
    belongs_to :pokemon 
    belongs_to :nature 
end
