require 'test_helper'

class PointTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @point_type = point_types(:one)
  end

  test "should get index" do
    get point_types_url, as: :json
    assert_response :success
  end

  test "should create point_type" do
    assert_difference('PointType.count') do
      post point_types_url, params: { point_type: { icon: @point_type.icon, name: @point_type.name, point_id: @point_type.point_id } }, as: :json
    end

    assert_response 201
  end

  test "should show point_type" do
    get point_type_url(@point_type), as: :json
    assert_response :success
  end

  test "should update point_type" do
    patch point_type_url(@point_type), params: { point_type: { icon: @point_type.icon, name: @point_type.name, point_id: @point_type.point_id } }, as: :json
    assert_response 200
  end

  test "should destroy point_type" do
    assert_difference('PointType.count', -1) do
      delete point_type_url(@point_type), as: :json
    end

    assert_response 204
  end
end
