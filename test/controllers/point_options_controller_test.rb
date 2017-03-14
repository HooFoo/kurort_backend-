require 'test_helper'

class PointOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @point_option = point_options(:one)
  end

  test "should get index" do
    get point_options_url, as: :json
    assert_response :success
  end

  test "should create point_option" do
    assert_difference('PointOption.count') do
      post point_options_url, params: { point_option: { name: @point_option.name, point_id: @point_option.point_id, type: @point_option.type } }, as: :json
    end

    assert_response 201
  end

  test "should show point_option" do
    get point_option_url(@point_option), as: :json
    assert_response :success
  end

  test "should update point_option" do
    patch point_option_url(@point_option), params: { point_option: { name: @point_option.name, point_id: @point_option.point_id, type: @point_option.type } }, as: :json
    assert_response 200
  end

  test "should destroy point_option" do
    assert_difference('PointOption.count', -1) do
      delete point_option_url(@point_option), as: :json
    end

    assert_response 204
  end
end
