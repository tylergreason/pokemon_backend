class UsersController < ApplicationController
    def create 
        byebug
        @user = User.create(user_params)
    end

    
    private
    def user_params
        # where require(:user) sets user to be the key you're looking for 
        #so, your params will have an object named 'user' and inside that will 
        # be the necessary data 
        params.require(:user).permit(:email, :password)
    end
end
