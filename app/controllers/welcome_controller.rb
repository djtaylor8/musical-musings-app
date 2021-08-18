class WelcomeController < ApplicationController
    def home
      @user = current_user
      render 'index'
    end
end