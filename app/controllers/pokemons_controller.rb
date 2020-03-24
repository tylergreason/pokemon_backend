class PokemonsController < ApplicationController
    # before_action :authorize!, only: [:index]

    def index 
        puts "this is current user:"
        puts current_user
        pokemons = Pokemon.all.sort_by {|pokemon| pokemon.number}
        # render :json => pokemons, :status => :ok
        render :json => pokemons, :include => [:types,:moves,:abilities,:natures,:active_moves, :non_active_moves], :status => :ok 
        # byebug
        # render :json => pokemons, :status => :ok
    end

    def update
        pokemon = Pokemon.find(params['id'])
        # byebug
        pokemon_to_return = pokemon.update_moves(params)
        # byebug
        render :json => pokemon_to_return, :include => [:types,:moves,:abilities,:natures,:active_moves, :non_active_moves], :status => :ok 
    end
end
