require "test_helper"

class Public::PostCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_post_comments_create_url
    assert_response :success
  end
end
