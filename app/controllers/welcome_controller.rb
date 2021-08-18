class WelcomeController < ApplicationController
    skip_before_action :authorize 

    def home
      render 'index'
    end

end