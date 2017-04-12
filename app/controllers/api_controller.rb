class ApiController < ActionController::API
  acts_as_token_authentication_handler_for User, fallback: :none
  before_action :set_locale

  def translations
    render json: I18n.backend.send(:translations).to_json
  end

  protected

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
