class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  
  private

  def after_sign_in_path_for(resource)
    store_location_for(:admin, admin_tests_path) if resource.admin?
    stored_location_for(:admin) || super 
  end

end
