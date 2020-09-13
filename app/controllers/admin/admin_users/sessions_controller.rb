# frozen_string_literal: true

class Admin::AdminUsers::SessionsController < Devise::SessionsController
  protected
  def after_sign_in_path_for(resource)
    admin_users_path
  end
  def after_sign_out_path_for(resource)
  new_admin_user_session_path
  end
end
