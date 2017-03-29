class Users::SessionsController < Devise::SessionsController
  acts_as_token_authentication_handler_for User, fallback: :none
  respond_to :json

  def create
    super do |resource|
      return render json: resource
    end
  end
end