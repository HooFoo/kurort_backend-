class UsersController < ApplicationController

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
