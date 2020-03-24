class Team < ApplicationRecord
    # validates :pokemons, uniqueness: true

    belongs_to :user
    has_many :pokemon_teams, dependent: :destroy 
    has_many :pokemons, through: :pokemon_teams

    def update_pokemon(new_pokemons)
        old_ids = self.pokemons.map{|pokemon|
            pokemon.id
        }
        new_ids = new_pokemons.map{|pokemon| pokemon['id']}
        ids_to_remove = old_ids - new_ids
        ids_to_add = new_ids - old_ids

        # remove all old associations 
        ids_to_remove.each {|id|
            PokemonTeam.where(team_id:self.id, pokemon_id:id)[0].destroy
        }
        # create new associations 
        ids_to_add.each {|id|
            PokemonTeam.create(team_id:self.id, pokemon_id:id)
        }

        self

        # self.pokemons = []
    end
end
