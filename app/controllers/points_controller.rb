class PointsController < ApiController
  before_action :set_point, only: [:show, :update, :destroy]

  # GET /points
  def index
    @points = Point.all

    render json: @points, include: %w(point_type attachments comments comments.attachments user)
  end

  # GET /points/1
  def show
    render json: @point
  end

  # POST /points
  def create
    @point = Point.new(point_params)

    if @point.save
      render json: @point, status: :created, location: @point
    else
      render json: @point.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /points/1
  def update
    if @point.update(point_params)
      render json: @point
    else
      render json: @point.errors, status: :unprocessable_entity
    end
  end

  # DELETE /points/1
  def destroy
    @point.destroy
  end

  def user_points
    begin
      user = User.find(params[:user_id])
      @points = user.points
    rescue
      @points = []
    end
    render json: @points
  end

  def my_points
    @user = current_user
    if @user.nil?
      render json: []
    else
      render json: @user.points
    end
  end

  def points_in_rect
    rect = params[:rect]
    @points = Point.get_rect(rect)
    render json: @points
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point
      @point = Point.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def point_params
      params.require(:point).permit(:user_id, :lat, :lng, :name, :description, :options)
    end
end
