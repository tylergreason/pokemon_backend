require 'faker'
# Pokemon.delete_all
User.delete_all
Team.delete_all 


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

9.times do 
    fetch_pokemon = PokeApi.get(pokemon: rand(150)+1)
    name = fetch_pokemon.name 
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

# user 
new_user = User.create(email:'test@mail.com', password:'test')

# create a new team, then give that team to the test user 
3.times do 
    new_team = Team.create(name: Faker::Team.name, description: "Desc: " + Faker::Lorem.sentence(word_count: 3), user_id: User.all.sample.id)
    3.times do 
        random_pokemon = Pokemon.all.sample 
        if !new_team.pokemons.include?(random_pokemon)
            new_team.pokemons << Pokemon.all.sample
        end
    end
    new_user.teams << new_team
end


# change all active moves to non active before activating more 
# PokemonMove.all.each {|move|
#     move.active = false 
#     move.save
# }
# make 4 of each pokemon's moves active 
Pokemon.all.each do |pokemon| 
    3.times do |time| 
        if pokemon.moves[time] != nil
            pokemon.set_move_active(pokemon.moves[time])
        end
    end
end
    # pokemon.set_move_active(pokemon.moves[1])
    # pokemon.set_move_active(pokemon.moves[2])
    # pokemon.set_move_active(pokemon.moves[3])
    # 4.times do |t|
    #     pokemon.set_move_active(pokemon.moves[t])
    # end