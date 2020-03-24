class PokemonsController < ApplicationController
    # before_action :authorize!, only: [:index]
    def show
        pokemon = Pokemon.find(params['id'])
        render :json => pokemon, :include => [:types,:abilities,:natures,:active_moves, :non_active_moves], :status => :ok 
    end



    def index 
        puts "this is current user:"
        puts current_user
        pokemons = Pokemon.all.sort_by {|pokemon| pokemon.number}
        # render :json => pokemons, :status => :ok
        render :json => pokemons, :include => [:types,:abilities,:natures,:active_moves], :status => :ok 
        # render :json => pokemons, :include => [:types,:abilities,:natures,:active_moves, :non_active_moves], :status => :ok 

        #  to make this faster: 
        # use a show action for when editing a pokemon 
        # for the index, don't render the non_active moves 
    end

    def update
        pokemon = Pokemon.find(params['id'])
        # byebug
        pokemon_to_return = pokemon.update_moves(params)
        # byebug
        render :json => pokemon_to_return, :include => [:types,:moves,:abilities,:natures,:active_moves, :non_active_moves], :status => :ok 
    end
end
