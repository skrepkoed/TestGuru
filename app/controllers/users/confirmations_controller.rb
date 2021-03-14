class Users::ConfirmationsController < Devise::ConfirmationsController
  private

  def after_confirmation_path_for(_resource_name, resource)
    flash_greeting(resource)
    sign_in(resource)
    store_location_for(:user, tests_path)
  end
end
