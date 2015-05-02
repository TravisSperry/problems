class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # def after_sign_in_path_for(resource)
  #   user_path(current_user)
  # end

  # def after_sign_out_path_for(resource_or_scope)
  #   root_path
  # end

  def authorize_admin
    redirect_to root_path, alert: 'Access Denied' unless current_user && current_user.admin?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u|
      u.permit(:password, :password_confirmation, :current_password)
    }
  end
end
