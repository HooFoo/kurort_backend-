class UsersController < ApplicationController
  acts_as_token_authentication_handler_for User, fallback: :none, only: [:current]

  def current
    @user = current_user
    render json: @user, include: '*'
  end

  def info
    begin
      @user = User.find(params[:id])
    rescue
      @user = nil
    end
    render json: @user, include: '*'
  end


end
