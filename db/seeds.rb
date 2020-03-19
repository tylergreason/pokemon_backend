Pokemon.delete_all
User.delete_all
# Type.delete_all 

# natures 
natures = PokeApi.get(:nature).results
natures.each do |nature| 
    name = nature.name
    Nature.find_or_create_by(name:name) 
end



fetchPokemon = PokeApi.get(pokemon: 'bulbasaur')
name = fetchPokemon.name 
number = fetchPokemon.id
new_pokemon = Pokemon.create(name:name,number:number)
# types 
types = PokeApi.get(:type).results
types.each do |type| 
    name = type.name 
    Type.find_or_create_by(name:name)
end
# nature 
new_pokemon.natures << Nature.all.sample
# types
fetchPokemon.types.each do |type| 
    new_pokemon.types << Type.find_or_create_by(name: type.type.name)
end
# abilities
abilities =  fetchPokemon.abilities
abilities.each do |result| 
    new_ability = Ability.find_or_create_by(name:result.ability.name)
    new_pokemon.abilities << new_ability
end
# moves 
moves = fetchPokemon.moves 
moves.each do |result| 
    new_move = Move.find_or_create_by(name: result.move.name)
    new_pokemon.moves << new_move
end



# user 
new_user = User.create(email: 'test@mail.com',password:'test')
# give user pokemon 
# remove this association 
new_user.pokemons << Pokemon.all.first
