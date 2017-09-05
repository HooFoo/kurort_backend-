class UsersController < ApiController
  acts_as_token_authentication_handler_for User, fallback: :none, only: [:current]

  def current
    @user = current_user
    return render json: @user, include: '*' if @user
    render json: {}, status: :unauthorized
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
