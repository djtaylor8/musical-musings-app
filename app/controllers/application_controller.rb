class ApplicationController < ActionController::Base 
    before_action :authorize 
    helper_method :current_user, :logged_in?  

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to user_path(current_user), alert: exception.message
    end
  
    
    def current_user
      user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!session[:user_id]
    end

    def authorize
      redirect_to root_url, flash: { :alert => "Not authorized - please login or create account!" } if current_user.nil?
    end

end
