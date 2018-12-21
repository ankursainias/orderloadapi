class ApplicationController < ActionController::Base
  acts_as_token_authentication_handler_for User, fallback: :exception

  private
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
  protected
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || orders_path
  end
end
