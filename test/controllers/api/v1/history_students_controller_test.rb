require 'test_helper'

class Api::V1::HistoryStudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_history_student = api_v1_history_students(:one)
  end

  test "should get index" do
    get api_v1_history_students_url, as: :json
    assert_response :success
  end

  test "should create api_v1_history_student" do
    assert_difference('Api::V1::HistoryStudent.count') do
      post api_v1_history_students_url, params: { api_v1_history_student: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_history_student" do
    get api_v1_history_student_url(@api_v1_history_student), as: :json
    assert_response :success
  end

  test "should update api_v1_history_student" do
    patch api_v1_history_student_url(@api_v1_history_student), params: { api_v1_history_student: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_history_student" do
    assert_difference('Api::V1::HistoryStudent.count', -1) do
      delete api_v1_history_student_url(@api_v1_history_student), as: :json
    end

    assert_response 204
  end
end
