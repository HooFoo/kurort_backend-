class ApplicationController < ActionController::Base
  include HttpAcceptLanguage::AutoLocale
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :lang_id])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :lang_id])
  end
end
