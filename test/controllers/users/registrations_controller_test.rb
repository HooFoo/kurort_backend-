require 'test_helper'

class Users::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    User.all.delete_all
  end
  test 'should register user' do
    assert_difference('User.count') do
      post user_registration_url, params: { user: { email: 'user2@no.no', password: '123456', password_confirmation: '123456' } }, as: :json
    end

    assert_response 201
  end
end