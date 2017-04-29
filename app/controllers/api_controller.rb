class ApiController < ActionController::API
  include HttpAcceptLanguage::AutoLocale
  acts_as_token_authentication_handler_for User, fallback: :none
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def translations
    render json: I18n.backend.send(:translations).to_json
  end

  protected

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :lang_id])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :lang_id])
  end
end
