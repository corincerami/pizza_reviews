class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:username, :first_name,
                                                 :last_initial, :avatar]
    devise_parameter_sanitizer.for(:account_update) << [:username, :first_name,
                                                        :last_initial, :avatar]
  end

  def authorize!
    if current_user.nil? or !current_user.is_admin?
      flash[:notice] = "You are not authorized"
      redirect_to root_path
    end
  end
end
