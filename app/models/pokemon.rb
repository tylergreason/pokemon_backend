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
        moves = []
        PokemonMove.all.where(pokemon_id: self.id,active:true).each do |move| 
            moves << Move.find(move.move_id)
        end
        moves
    end

    def set_move_active(move)
        pokemon_move = PokemonMove.find_by(pokemon_id: self.id, move_id: move.id)
        pokemon_move.active = true
        pokemon_move.save 
    end
end