class Pokemon < ApplicationRecord
    has_many :pokemon_types, dependent: :destroy
    has_many :types, through: :pokemon_types

    has_many :pokemon_natures, dependent: :destroy 
    has_many :natures, through: :pokemon_natures
    
    has_many :pokemon_abilities, dependent: :destroy 
    has_many :abilities, through: :pokemon_abilities
    
    has_many :pokemon_moves, dependent: :destroy 
    has_many :moves, through: :pokemon_moves

    has_many :pokemon_teams, dependent: :destroy 
    has_many :teams, through: :pokemon_teams

    def active_moves 
        PokemonMove.where(pokemon_id: self.id, active:true).map{|join| join.move}
        # self.pokemon_moves.select{|pm| pm.active}.map{|pm| pm.move}
    end

    def non_active_moves 
        # could have just done self.moves - self.active_moves!!!!!!!!!!!!
        moves = []
        PokemonMove.all.where(pokemon_id: self.id,active:false).each do |move| 
            moves << Move.find(move.move_id)
        end
        moves
    end

    def set_move_active(move)
        # byebug
        pokemon_move = PokemonMove.find_by(pokemon_id: self.id, move_id: move['id'])
        pokemon_move.active = true
        pokemon_move.save 
    end

    def update_moves(params)
        # byebug
        moves = [] 
        params['activeMoves'].each {|move|
            # byebug
            self.set_move_active(move)
            # new_active_move = PokemonMove.find_by(pokemon_id:self.id,move_id:move['id'])
        }
        # params['nonActiveMoves'].each {|move|
        #     new_non_active_move = PokemonMove.find_by(pokemon_id:self.id,move_id:move['id'])
        #     new_non_active_move.active = false 
        #     new_non_active_move.save
        # }
        # byebug
        self
    end
end