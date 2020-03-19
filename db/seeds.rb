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
newPokemon = Pokemon.create(name:name,number:number)
# nature 
newPokemon.natures << Nature.all.sample
# types
fetchPokemon.types.each do |type| 
    newPokemon.types << Type.find_or_create_by(name: type.type.name)
end
# abilities
abilities =  fetchPokemon.abilities
abilities.each do |result| 
    new_ability = Ability.find_or_create_by(name:result.ability.name)
    newPokemon.abilities << new_ability
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
# remove this association 
new_user.pokemons << Pokemon.all.first
