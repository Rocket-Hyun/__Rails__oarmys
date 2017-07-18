class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :null_session

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :agree])
  end


  def require_login
  	unless user_signed_in?
  		redirect_to "/users/sign_in"
  	end
  end

  def require_admin
  	unless user_signed_in? and current_user.tag_list.include?("master")
  		redirect_to "/users/sign_in"
  	end
  end

end
