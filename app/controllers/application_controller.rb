class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def flash_greeting(resource)
    flash[:greeting] = "Hello, #{resource.full_name}"
  end

  private

  def after_sign_in_path_for(resource)
    flash_greeting(resource)
    if resource.admin?
      admin_tests_path
    else
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username first_name last_name])
  end
end
