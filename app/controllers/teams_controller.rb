class TeamsController < ApplicationController
    def update
        # byebug 
        new_pokemons = params['pokemons']
        team_id = params['team']['id']
        team_to_edit = Team.find_by_id(team_id)
        team_to_edit.update_pokemons(new_pokemons)
        team_to_return = Team.find_by_id(team_id)
        # byebug
        render :json => team_to_return, :include => {:pokemons => {:include => [:types,:moves,:abilities,:natures,:active_moves]}}, :status => :ok 
    end

    def myteams 
        # return all the logged in user's teams 
        teams = Team.where(user_id: current_user.id)
        render :json => teams, :include => {:pokemons => {:include => [:types,:moves,:abilities,:natures,:active_moves]}}, :status => :ok 
        # render :json => routines, :include => {:workouts => {:include => :muscles}}
        # .sort_by {|r| r.date}.reverse
    end
end
