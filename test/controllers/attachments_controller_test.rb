require 'test_helper'

class AttachmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attachment = attachments(:one)
  end

  test "should get index" do
    get attachments_url, as: :json
    assert_response :success
  end

  test "should create attachment" do
    assert_difference('Attachment.count') do
      post attachments_url, params: { attachment: { comment_id: @attachment.comment_id, link: @attachment.link, point_id: @attachment.point_id } }, as: :json
    end

    assert_response 201
  end

  test "should show attachment" do
    get attachment_url(@attachment), as: :json
    assert_response :success
  end

  test "should update attachment" do
    patch attachment_url(@attachment), params: { attachment: { comment_id: @attachment.comment_id, link: @attachment.link, point_id: @attachment.point_id } }, as: :json
    assert_response 200
  end

  test "should destroy attachment" do
    assert_difference('Attachment.count', -1) do
      delete attachment_url(@attachment), as: :json
    end

    assert_response 204
  end
end
