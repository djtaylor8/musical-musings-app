class UsersController < ApplicationController
  load_and_authorize_resource

    def new 
        @user = User.new 
    end
    
    def show
      @user = current_user
    end

    def create 
      @user = User.new(user_params)
      if @user.save 
        session[:user_id] = @user.id 
        redirect_to user_path(@user)
      else
        render 'new'
      end
    end

    def edit
      @user = current_user
    end

    def update
      @user = current_user 
      @user.update(user_params)
      redirect_to @user
    end

    def destroy 
      @user = current_user
      session[:user_id] = nil
      @user.destroy 
      redirect_to root_url
    end 

    private 

    def user_params
      params.require(:user).permit(:name, :email, :bio, :provider, :uid, :password)
    end

end
