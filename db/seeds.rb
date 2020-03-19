Pokemon.delete_all
User.delete_all
# Type.delete_all 


bulbasaur = PokeApi.get(pokemon: 'bulbasaur')
name = bulbasaur.name 
number = bulbasaur.id
newPokemon = Pokemon.create(name:name,number:number)
bulbasaur.types.each do |type| 
    newPokemon.types << Type.find_or_create_by(name: type.type.name)
end


# types 
types = PokeApi.get(:type).results
types.each do |type| 
    name = type.name 
    Type.find_or_create_by(name:name)
end

# user 
new_user = User.create(email: 'test@mail.com',password:'test')
# give user pokemon 
new_user.pokemons << Pokemon.all.first