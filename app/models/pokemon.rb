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
        old_ids = self.active_moves.map{|move| move.id}
        new_ids = params['activeMoves'].map{|move|
            move['id']
        }
        ids_to_remove = old_ids - new_ids 
        ids_to_add = new_ids - old_ids

        ids_to_remove.each {|move_id|
            pokemon_move_to_remove = PokemonMove.find_by(pokemon_id:self.id, move_id:move_id)
            pokemon_move_to_remove.active = false 
            pokemon_move_to_remove.save 
        }

        ids_to_add.each {|move_id|
            pokemon_move_to_add = PokemonMove.find_by(pokemon_id:self.id, move_id:move_id)
            pokemon_move_to_add.active = true 
            pokemon_move_to_add.save 
        }
        self
    end
end