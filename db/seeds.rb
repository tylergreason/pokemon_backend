Pokemon.delete_all
User.delete_all


# natures 
natures = PokeApi.get(:nature).results
natures.each do |nature| 
    name = nature.name
    Nature.find_or_create_by(name:name) 
end
# types 
types = PokeApi.get(:type).results
types.each do |type| 
    name = type.name 
    Type.find_or_create_by(name:name)
end

2.times do 
    fetch_pokemon = PokeApi.get(pokemon: rand(150)+1)
    name = fetch_pokemon.name 
    number = fetch_pokemon.id
    new_pokemon = Pokemon.find_or_create_by(name:name,number:number)
    # nature 
    new_pokemon.natures << Nature.all.sample
    # types
    fetch_pokemon.types.each do |type| 
        new_pokemon.types << Type.find_or_create_by(name: type.type.name)
    end
    # abilities
    abilities =  fetch_pokemon.abilities
    abilities.each do |result| 
        new_ability = Ability.find_or_create_by(name:result.ability.name)
        new_pokemon.abilities << new_ability
    end
    # moves 
    moves = fetch_pokemon.moves 
    moves.each do |result| 
        new_move = Move.find_or_create_by(name: result.move.name)
        new_pokemon.moves << new_move
    end
end

# fetch_pokemon = PokeApi.get(pokemon: 'bulbasaur')



# user 
new_user = User.create(email:'test@mail.com', password:'test')
# give user pokemon 
# remove this association 
# new_user.pokemons << Pokemon.all.first
