class WelcomeController < ApplicationController
    skip_before_action :authorize 

    def home
      @user = current_user
      render 'index'
    end

end