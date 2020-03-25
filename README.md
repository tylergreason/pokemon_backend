# Pokemon Team Builder, Backend

This is a server meant to host teams of pokemon built by users of my [Pokemon Frontend](https://github.com/tylergreason/pokemon_frontend) web application. 

## Background 

This project was made to serve as the backend for one of my projects for Flatiron School. It was built in roughly one week alongside the frontend. You can read more about that project at the repository for the frontend of this project [here](https://github.com/tylergreason/pokemon_frontend). 

## Functionality 

This Rails application holds data for a multitude of models, including : 
 - Users 
 - Teams 
 - Pokemon 
 - Moves 
 - Types 
 - Abilities 
 - Natures 

Users have many teams, teams have many Pokemon, and Pokemon have many moves, types, attributes, and natures. Each connected model also has a joining table (Pokemon to Move, Pokemon to Team, Team to User, etcetera). During the process of building the application I realized I could have gotten rid of a few models, but this will have to be done later given the time constraint of only a few days. Originally I wanted each model to have a joining table to afford any extra functionality that would bring. 

For instance: because a Pokemon can only have four learned moves at one time, but they have the potential to learn a multitude of other moves, and because individual Pokemon can learn the same moves as other Pokemon, it makes sense to have one instance of a Move that each of those Pokemon share through a joining table. Also, to accomodate a Pokemon only being able to learn four moves at once, I set an 'active' boolean attribute on the joining table. Each Pokemon, when generated in the seed file, has their first four move's joining table's active attribute set to true. The same functionality will be implemented for Abilities, as a Pokemon can only learn on of its two potential abilities, and many Pokemon may have the same ability. 

The same cannot be said for Nature and Type. Types are pre-determined, the user cannot change a Pokemon's types. Natures can be changed, but because there are only 20 available natures, it makes sense to have that as a string attribute on the Pokemon model, not its own model with a join table. 

The functionality is currently very limited due to time constraints. A user can: 

- Create an account 
- Log in 
- Log out 
- Edit their team's name, description, and Pokemon 
- Edit a Pokemon's moves 
- View all of their Pokemon
- View all of their teams and their team's Pokemon 

Once I have time to come back to this application I would like to add functionality to change a Pokemon's nature, create new teams from scratch, delete the user's account, show Pokemon's statistics and the statistical bonuses they receive from their nature, and show team data relating to how many Pokemon of each type the team has, what the teams average statistics are amongst their Pokemon, and more. 

## Tools and Technologies 

-  [Ruby on Rails 6](https://rubyonrails.org/)

-  [Faker](https://github.com/faker-ruby/faker)

- [PokeAPI Ruby Gem](https://github.com/rdavid1099/poke-api-v2)

## Installation 

```
# clone this repo

git clone git@github.com:tylergreason/pokemon_backend.git

# cd into its directory

cd pokemon_backend

# bundle/install the necessary gems 

bundle install

# migrate the database 

rails db:migrate

# seed the database 

rails db:seed

# start a rails server

rails s
```

You can then use your own application to interface with the database or use [my frontend web application](https://github.com/tylergreason/pokemon_frontend). 
