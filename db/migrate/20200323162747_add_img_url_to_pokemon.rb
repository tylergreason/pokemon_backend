class AddImgUrlToPokemon < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :image_url, :string
  end
end
