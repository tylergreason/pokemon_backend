class ChangeDefaultValueForPokemonMoveActive < ActiveRecord::Migration[6.0]
  def change
    change_column :pokemon_moves, :active, :boolean, default: false
  end
end
