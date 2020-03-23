class TeamsController < ApplicationController
    def index 

    end

    def myteams 
        # return all the logged in user's teams 
        teams = Team.where(user_id: current_user.id)
        render :json => teams, :include => {:pokemons => {:include => [:types,:moves,:abilities,:natures,:active_moves]}}, :status => :ok 
        # render :json => routines, :include => {:workouts => {:include => :muscles}}
        # .sort_by {|r| r.date}.reverse
    end
end
