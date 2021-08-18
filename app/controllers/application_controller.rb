class ApplicationController < ActionController::Base 
    before_action :authorize 
    helper_method :current_user, :user_signed_in?  

    def current_user
      user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def user_signed_in?
      !!current_user 
    end

    def authorize
      redirect_to root_url, flash: { :alert => "Not authorized - please login or create account!" } if current_user.nil?
    end

end
