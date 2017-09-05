class UsersController < ApplicationController

    def new
    end

    def create
        user = User.new(
                        name: params[:name],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation]
                        )
        if user.save
            session[:user_id] = user.id
            flash[:success] = "You created a new account!"
            redirect_to '/'
        else
            flash[:warning] = "Oops, something went wrong"
            redirect_to '/signup'
        end
    end  
end
