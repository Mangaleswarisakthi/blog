
class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception

before_action :store_user_location!, if: :storable_location?
before_action :configure_permitted_parameters, if: :devise_controller?

private
def storable_location?
	request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
end
def store_user_location!
	store_location_for(:user, request.fullpath)
end

  protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password) }
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password) }
        end
  
      
end
