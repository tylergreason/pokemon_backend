class PokemonType < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemon_type do |t|
      t.references :pokemon, foreign_key: true
      t.references :type, foreign_key: true
    end
  end
end
