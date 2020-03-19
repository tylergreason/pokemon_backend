class CreatePokemonNatures < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemon_natures do |t|
      t.integer :pokemon_id 
      t.integer :nature_id 
      t.timestamps
    end
  end
end
