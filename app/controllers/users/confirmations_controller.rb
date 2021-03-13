class Users::ConfirmationsController < Devise::ConfirmationsController
  private
  def after_confirmation_path_for(resource_name, resource)
    flash[:greeting]="Hello #{resource.full_name}"
    sign_in(resource) 
  end
end