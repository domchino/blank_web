class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :artist_name, :creative_field, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :artist_name, :creative_field, :bio, :password, :password_conirmation, :current_password])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :email, :password, :remember_me])
  end
end
