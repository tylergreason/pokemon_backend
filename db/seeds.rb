require 'faker'
# Pokemon.delete_all
User.delete_all
Team.delete_all 


# reset all pokemon types 


# natures 
# only seed natures if Nature.all is empty 
if Nature.all.count == 0 
    natures = PokeApi.get(:nature).results
    natures.each do |nature| 
        name = nature.name
        Nature.find_or_create_by(name:name) 
    end
end

# types 
# only seed types if Type.all is empty 
if Type.all.count == 0 
    types = PokeApi.get(:type).results
    types.each do |type| 
        name = type.name 
        Type.find_or_create_by(name:name)
    end
end

700.times do |time|
    pokemon_number = time+1
    
    if Pokemon.find_by(number: pokemon_number) == nil

        fetch_pokemon = PokeApi.get(pokemon: pokemon_number)
        name = fetch_pokemon.name.capitalize
        number = fetch_pokemon.id
        image_url = fetch_pokemon.sprites.front_default
        new_pokemon = Pokemon.find_or_create_by(name:name,number:number,image_url:image_url)
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
end

# user 
new_user = User.create(email:'test@mail.com', password:'test')

# create a new team, then give that team to the test user 
4.times do 
    new_team = Team.create(name: Faker::Team.name, description: "Desc: " + Faker::Lorem.sentence(word_count: 3), user_id: User.all.sample.id)
    3.times do 
        random_pokemon = Pokemon.all.sample 
        if !new_team.pokemons.include?(random_pokemon)
            new_team.pokemons << Pokemon.all.sample
        end
    end
    new_user.teams << new_team
end

# make 4 of each pokemon's moves active 
Pokemon.all.each do |pokemon| 
    # make each move not active 
    PokemonMove.where(pokemon_id: pokemon.id, active:true).each {|pokemonMove|
        pokemonMove.active = false 
        pokemonMove.save 
    }
    4.times do |time| 
        if pokemon.moves[time] != nil
            pokemon.set_move_active(pokemon.moves[time])
        end
    end
end