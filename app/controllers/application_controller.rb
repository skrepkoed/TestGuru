class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  
  private

  def after_sign_in_path_for(resource)
    store_location_for(:admin, admin_tests_path) if resource.admin?
    redirect = stored_location_for(:admin) || root_path
    return redirect if redirect.present? 
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name])
  end
end
