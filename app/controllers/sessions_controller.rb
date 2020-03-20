class SessionsController < ActionController::API
    def create
        @user = User.find_by(email: session_params[:email])
        if @user && @user.authenticate(session_params[:password])
            render :json => @user, :status => :ok
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
