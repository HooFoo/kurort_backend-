class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_scope!, only: [:update]
  acts_as_token_authentication_handler_for User, only: [:update]
  respond_to :json

  def update
    super do |resource|
      return render json: resource
    end
  end

  protected

  def update_resource(resource, params)
    resource.update(params)
  end
end