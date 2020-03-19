class Move < ApplicationRecord
    has_many :pokemon_moves, dependent: :destroy
    has_many :pokemon, through: :pokemon_moves
end
