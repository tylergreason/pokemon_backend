class Team < ApplicationRecord
    belongs_to :user
    has_many :pokemon_teams, dependent: :destroy 
    has_many :pokemons, through: :pokemon_teams
end
