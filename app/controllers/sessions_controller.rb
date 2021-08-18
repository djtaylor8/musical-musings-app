class SessionsController < ApplicationController

    def new
    end
  
    def create
      if request.env["omniauth.auth"]
        user = User.from_omniauth(request.env["omniauth.auth"])
        session[:user_id] = user.id
      else 
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        end 
      end 
      redirect_to user_path(user), notice: "Signed in!"
    end

    def destroy
      session[:user_id] = nil 
      redirect_to root_url, notice: "Signed out!"
    end

end
