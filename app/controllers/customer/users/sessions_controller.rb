# frozen_string_literal: true

class Customer::Users::SessionsController < Devise::SessionsController
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_up_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:account_name])
  end

  def reject_user
    user = User.find_by(email: params[:user][:email].downcase)
    if user
      if (user.valid_password?(params[:customer][:password]) && (customer.active_for_authentication? == true))
        redirect_to new_user_session_path
      end
    end
  end
end
