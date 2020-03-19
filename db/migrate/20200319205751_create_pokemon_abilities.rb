class CreatePokemonAbilities < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemon_abilities do |t|
      t.integer :pokemon_id 
      t.integer :ability_id
      t.timestamps
    end
  end
end
