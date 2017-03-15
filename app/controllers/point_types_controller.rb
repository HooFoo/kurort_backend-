class PointTypesController < ApiController
  before_action :set_point_type, only: [:show, :update, :destroy]

  # GET /point_types
  def index
    @point_types = PointType.all

    render json: @point_types
  end

  # GET /point_types/1
  def show
    render json: @point_type
  end

  # POST /point_types
  def create
    @point_type = PointType.new(point_type_params)

    if @point_type.save
      render json: @point_type, status: :created, location: @point_type
    else
      render json: @point_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /point_types/1
  def update
    if @point_type.update(point_type_params)
      render json: @point_type
    else
      render json: @point_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /point_types/1
  def destroy
    @point_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point_type
      @point_type = PointType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def point_type_params
      params.require(:point_type).permit(:name, :point_id, :icon)
    end
end
