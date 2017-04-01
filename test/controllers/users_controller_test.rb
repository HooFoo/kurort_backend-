require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get current" do
    get users_current_url
    assert_response :success
  end

  test "should get info" do
    get users_info_url
    assert_response :success
  end

end
