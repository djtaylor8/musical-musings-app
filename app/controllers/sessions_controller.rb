class SessionsController < ApplicationController
  skip_before_action :authorize 

    def new
    end
  
    def create
      if request.env["omniauth.auth"]
        user = User.from_omniauth(request.env["omniauth.auth"])
        session[:user_id] = user.id
        redirect_to user_path(user), notice: "Signed in!"
      elsif EmailValidator.valid?("#{params[:email]}") 
        user = User.find_by(email: params[:email]) 
        if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_path(user), notice: "Signed in!"
        else 
          redirect_to login_path, notice: "Invalid email or password. Please try again!"
        end 
      else
        redirect_to login_path, notice: "Invalid email or password. Please try again!"
      end 
    end

    def destroy
      session[:user_id] = nil 
      redirect_to root_url, notice: "Signed out!"
    end

end
