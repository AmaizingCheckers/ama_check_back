require 'net/http'
require 'json'

class Api::V1::HistoryStudentsController < ApplicationController
  before_action :set_history_student, only: [:show, :update, :destroy]
  before_action :authenticate_api_v1_user!

  # GET /api/v1/history_students
  # def index
  #   @history_students = HistoryStudent.all

  #   render json: @history_students
  # end

  # GET /api/v1/history_students/1
  # def show
  #   render json: @history_student
  # end

  # POST /api/v1/history_students
  # def create
  #   @history_student = HistoryStudent.new(history_student_params)

  #   if @history_student.save
  #     render json: @history_student, status: :created, location: @history_student
  #   else
  #     render json: @history_student.errors, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /api/v1/history_students/1
  # def update
  #   if @history_student.update(history_student_params)
  #     render json: @history_student
  #   else
  #     render json: @history_student.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /api/v1/history_students/1
  # def destroy
  #   @history_student.destroy
  # end

  # GET /api/v1/history_students/attendance_result?history_id=history_id
  def attendance_result
    history_id = params["history_id"]
    Net::HTTP.get(URI.parse("#{ENV['PY_SERVER_URL']}/image_matching/history/#{history_id}"))
    history_student = HistoryStudent.where(history_id: history_id)
    render json: history_student
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_history_student
      @history_student = HistoryStudent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def history_student_params
      params.require(:history)
        .permit(
          :history_id
        )
    end
end
