class Pokemon < ApplicationRecord
    has_many :pokemon_types, dependent: :destroy
    has_many :types, through: :pokemon_types
    # disconnect user and pokemon 
    # has_many :user_pokemons, dependent: :destroy 
    # has_many :users, through: :user_pokemons

    has_many :pokemon_natures, dependent: :destroy 
    has_many :natures, through: :pokemon_natures
    
    has_many :pokemon_abilities, dependent: :destroy 
    has_many :abilities, through: :pokemon_abilities
    
    has_many :pokemon_moves, dependent: :destroy 
    has_many :moves, through: :pokemon_moves

    has_many :pokemon_teams, dependent: :destroy 
    has_many :teams, through: :pokemon_teams

    def active_moves 
        PokemonMove.all.find_by(pokemon_id: self.id,active:true)
    end
end