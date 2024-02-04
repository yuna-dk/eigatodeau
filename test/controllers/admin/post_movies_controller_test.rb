require "test_helper"

class Admin::PostMoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_post_movies_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_post_movies_show_url
    assert_response :success
  end
end
