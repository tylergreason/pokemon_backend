class Team < ApplicationRecord
    belongs_to :user
    has_many :pokemon_teams, dependent: :destroy 
    has_many :pokemon, through: :pokemon_teams
end
