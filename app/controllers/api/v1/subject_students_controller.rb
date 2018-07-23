class Api::V1::SubjectStudentsController < ApplicationController
  before_action :set_subject_student, only: [:show, :update, :destroy]
  before_action :authenticate_api_v1_user!

  # GET /api/v1/subject_students
  def index
    @subject_students = SubjectStudent.all

    render json: @subject_students
  end

  # GET /api/v1/subject_students/1
  def show
    render json: @subject_student
  end

  # POST /api/v1/subject_students
  def create
    @subject_student = SubjectStudent.new(subject_student_params)

    if @subject_student.save
      render json: @subject_student, status: :created, location: @subject_student
    else
      render json: @subject_student.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/subject_students/1
  def update
    if @subject_student.update(subject_student_params)
      render json: @subject_student
    else
      render json: @subject_student.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/subject_students/1
  def destroy
    @subject_student.destroy
  end

  # GET /api/v1/subject_students/find_by_subject/1
  def find_by_subject
    subject_student = SubjectStudent.where(subject_id: params[:subject_id])

    render json: subject_student, each_serializer: SubjectStudentsAttachedStudentsSerializer
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject_student
      @subject_student = SubjectStudent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subject_student_params
      params
        .fetch(:subject_student, {})
        .permit(
          :id,
          :subject_id,
          :student_id
        )
    end
end
