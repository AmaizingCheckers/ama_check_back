class Api::V1::SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :update, :destroy]
  before_action :authenticate_api_v1_user!

  # GET /api/v1/subjects
  def index
    @subjects = Subject.all

    render json: @subjects
  end

  # GET /api/v1/subjects/1
  def show
    render json: @subject
  end

  # POST /api/v1/subjects
  # def create
  #   @subject = Subject.new(subject_params)

  #   if @subject.save
  #     render json: @subject, status: :created, location: @subject
  #   else
  #     render json: @subject.errors, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /api/v1/subjects/1
  # def update
  #   if @subject.update(subject_params)
  #     render json: @subject
  #   else
  #     render json: @subject.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /api/v1/subjects/1
  # def destroy
  #   @subject.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subject_params
      params.fetch(:subject, {})
    end
end
