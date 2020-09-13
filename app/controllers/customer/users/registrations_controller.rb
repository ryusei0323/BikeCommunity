# frozen_string_literal: true

class Customer::Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_up_path_for(resource)
    root_path
  end
  # If you have extra params to permit, append them to the sanitizer.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :account_name, :profile_sentence, :profile_image_id, :user_status])
  end

end
