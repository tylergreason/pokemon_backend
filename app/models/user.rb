class User < ApplicationRecord
    has_secure_password
    has_many :user_pokemons, dependent: :destroy 
    has_many :pokemons, through: :user_pokemons
end
