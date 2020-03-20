class PokemonsController < ApplicationController
    # before_action :authorize!, only: [:index]

    def index 
        puts "this is current user:"
        puts current_user
        pokemons = Pokemon.all
        render :json => pokemons, :status => :ok
        # byebug
        # render :json => pokemons, :status => :ok
    end
end
