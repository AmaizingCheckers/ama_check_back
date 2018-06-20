require 'test_helper'

class Api::V1::SubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_subject = api_v1_subjects(:one)
  end

  test "should get index" do
    get api_v1_subjects_url, as: :json
    assert_response :success
  end

  test "should create api_v1_subject" do
    assert_difference('Api::V1::Subject.count') do
      post api_v1_subjects_url, params: { api_v1_subject: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_subject" do
    get api_v1_subject_url(@api_v1_subject), as: :json
    assert_response :success
  end

  test "should update api_v1_subject" do
    patch api_v1_subject_url(@api_v1_subject), params: { api_v1_subject: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_subject" do
    assert_difference('Api::V1::Subject.count', -1) do
      delete api_v1_subject_url(@api_v1_subject), as: :json
    end

    assert_response 204
  end
end
