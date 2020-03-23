class User < ApplicationRecord
    validates :email, uniqueness: true 
    has_secure_password
    
    has_many :teams
    has_many :pokemon, through: :teams 
    # has_many :user_pokemons, dependent: :destroy 
    # has_many :pokemons, through: :user_pokemons
end
