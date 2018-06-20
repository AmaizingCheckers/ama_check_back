require 'test_helper'

class Api::V1::ClassroomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_classroom = api_v1_classrooms(:one)
  end

  test "should get index" do
    get api_v1_classrooms_url, as: :json
    assert_response :success
  end

  test "should create api_v1_classroom" do
    assert_difference('Api::V1::Classroom.count') do
      post api_v1_classrooms_url, params: { api_v1_classroom: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_classroom" do
    get api_v1_classroom_url(@api_v1_classroom), as: :json
    assert_response :success
  end

  test "should update api_v1_classroom" do
    patch api_v1_classroom_url(@api_v1_classroom), params: { api_v1_classroom: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_classroom" do
    assert_difference('Api::V1::Classroom.count', -1) do
      delete api_v1_classroom_url(@api_v1_classroom), as: :json
    end

    assert_response 204
  end
end
