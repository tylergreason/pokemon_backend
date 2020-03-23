class AddActiveToPokemonMoves < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemon_moves, :active, :boolean
  end
end
