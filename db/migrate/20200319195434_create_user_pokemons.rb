class CreateUserPokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :user_pokemons do |t|
      t.integer :user_id 
      t.integer :pokemon_id
      t.timestamps
    end
  end
end
