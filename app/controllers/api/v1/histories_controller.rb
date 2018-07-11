class Api::V1::HistoriesController < ApplicationController
  before_action :set_history, only: [:show, :update, :destroy]
  before_action :authenticate_api_v1_user!

  # GET /api/v1/histories
  # def index
  #   @histories = History.all

  #   render json: @histories
  # end

  # GET /api/v1/histories/1
  # def show
  #   render json: @history
  # end

  # POST /api/v1/histories
  # def create
  #   @history = History.new(history_params)

  #   if @history.save
  #     render json: @history, status: :created, location: @history
  #   else
  #     render json: @history.errors, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /api/v1/histories/1
  # def update
  #   if @history.update(history_params)
  #     render json: @history
  #   else
  #     render json: @history.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /api/v1/histories/1
  # def destroy
  #   @history.destroy
  # end

  # POST /api/v1/histories/attendance_image_upload
  def attendance_image_upload
    raise 'params not found' if params[:subject_id].blank? || params[:image].blank?

    history = History.create(subject_id: params[:subject_id])
    history.image_name = params[:image]
    history.save!

    render json: history
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_history
      @history = History.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def history_params
      params.require(:history)
        .permit(
          :subject_id,
          :image_name
        )
    end
end
