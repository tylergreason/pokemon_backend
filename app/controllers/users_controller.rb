class UsersController < ApplicationController
    def create 
        # byebug
        @user = User.create(user_params)
        token = JWT.encode({ :user_id => @user.id }, ENV['SECRET'])
        render :json => { :token => token } , :status => :ok
    end

    private
    def user_params
        # where require(:user) sets user to be the key you're looking for 
        #so, your params will have an object named 'user' and inside that will 
        # be the necessary data 
        params.require(:user).permit(:email, :password)
    end
end
