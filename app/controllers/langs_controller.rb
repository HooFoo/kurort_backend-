class LangsController < ApiController
  before_action :set_lang, only: [:show, :update, :destroy]

  # GET /langs
  def index
    @langs = Lang.all

    render json: @langs
  end

  # GET /langs/1
  def show
    render json: @lang
  end

  # POST /langs
  def create
    @lang = Lang.new(lang_params)

    if @lang.save
      render json: @lang, status: :created, location: @lang
    else
      render json: @lang.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /langs/1
  def update
    if @lang.update(lang_params)
      render json: @lang
    else
      render json: @lang.errors, status: :unprocessable_entity
    end
  end

  # DELETE /langs/1
  def destroy
    @lang.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lang
      @lang = Lang.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lang_params
      params.require(:lang).permit(:name)
    end
end
