class Pokemon < ApplicationRecord
    has_many :pokemon_types, dependent: :destroy
    has_many :types, through: :pokemon_types
end
