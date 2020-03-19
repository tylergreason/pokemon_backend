class RemoveTypesFromPokemonTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :pokemons, :type_1
    remove_column :pokemons, :type_2
  end
end
