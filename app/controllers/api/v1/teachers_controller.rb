class Api::V1::TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :update, :destroy]
  before_action :authenticate_api_v1_user!

  # GET /api/v1/teachers
  def index
    @teachers = Teacher.all

    render json: @teachers
  end

  # GET /api/v1/teachers/search_teacher?name={params}
  def search_teacher
    @teacher = Teacher.left_joins(:user).where(users: {id: params['user_id']})
    render json: @teacher
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def teacher_params
      params.fetch(:teacher, {})
    end
end
