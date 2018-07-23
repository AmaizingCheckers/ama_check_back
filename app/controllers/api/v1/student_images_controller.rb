class Api::V1::StudentImagesController < ApplicationController
  before_action :set_student_image, only: [:show, :update, :destroy]
  before_action :authenticate_api_v1_user!

  # GET /api/v1/student_images
  def index
    @student_images = StudentImage.all

    render json: @student_images
  end

  # GET /api/v1/student_images/1
  def show
    render json: @student_image
  end

  # POST /api/v1/student_images
  def create
    raise 'params not found' if params[:student_id].blank? || params[:image].blank?

    student_image = StudentImage.create(student_id: params[:student_id])
    student_image.image_path = params[:image]
    student_image.save!

    render json: student_image
  end

  # PATCH/PUT /api/v1/student_images/1
  # def update
  #   if @student_image.update(student_image_params)
  #     render json: @student_image
  #   else
  #     render json: @student_image.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /api/v1/student_images/1
  def destroy
    @student_image.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_image
      @student_image = StudentImage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def student_image_params
      params.fetch(:student_image, {})
        .permit(
          :id,
          :student_id,
          :image
        )
    end
end
