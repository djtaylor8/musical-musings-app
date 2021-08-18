class ApplicationController < ActionController::Base
    helper_method :current_user, :authorize  

    def current_user
      user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def user_signed_in?
      !!current_user 
    end

    def authorize
      redirect_to login_url
    end

end
