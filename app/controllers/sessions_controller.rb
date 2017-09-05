class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:success] = "Come on in!"
            redirect_to '/'
        else
            flash[:warning] = "Oops, something went wrong"
            redirect_to '/login'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "See ya later!"
        redirect_to '/login'
    end
end
