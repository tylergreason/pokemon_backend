class SessionsController < ApplicationController
    def create
        @user = User.find_by(email: session_params[:email])

        if @user && @user.authenticate(session_params[:password])
            token = JWT.encode({:user_id => @user.id}, ENV['SECRET'])
            # byebug
            render :json => { :token => token } , :status => :ok
        else
            render :json => {:msg => "login failed!!"}
        end
    end

    def destroy 

    end

    private 
    def session_params 
        params.require(:user).permit(:email, :password)
    end
end
