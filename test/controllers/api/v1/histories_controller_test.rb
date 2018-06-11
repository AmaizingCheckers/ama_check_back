require 'test_helper'

class Api::V1::HistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_history = api_v1_histories(:one)
  end

  test "should get index" do
    get api_v1_histories_url, as: :json
    assert_response :success
  end

  test "should create api_v1_history" do
    assert_difference('Api::V1::History.count') do
      post api_v1_histories_url, params: { api_v1_history: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_history" do
    get api_v1_history_url(@api_v1_history), as: :json
    assert_response :success
  end

  test "should update api_v1_history" do
    patch api_v1_history_url(@api_v1_history), params: { api_v1_history: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_history" do
    assert_difference('Api::V1::History.count', -1) do
      delete api_v1_history_url(@api_v1_history), as: :json
    end

    assert_response 204
  end
end
