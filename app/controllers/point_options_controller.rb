class PointOptionsController < ApiController
  before_action :set_point_option, only: [:show, :update, :destroy]

  # GET /point_options
  def index
    @point_options = PointOption.all

    render json: @point_options
  end

  # GET /point_options/1
  def show
    render json: @point_option
  end

  # POST /point_options
  def create
    @point_option = PointOption.new(point_option_params)

    if @point_option.save
      render json: @point_option, status: :created, location: @point_option
    else
      render json: @point_option.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /point_options/1
  def update
    if @point_option.update(point_option_params)
      render json: @point_option
    else
      render json: @point_option.errors, status: :unprocessable_entity
    end
  end

  # DELETE /point_options/1
  def destroy
    @point_option.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point_option
      @point_option = PointOption.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def point_option_params
      params.require(:point_option).permit(:name, :type, :point_id)
    end
end
