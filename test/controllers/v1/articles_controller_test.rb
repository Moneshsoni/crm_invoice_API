require "test_helper"

class V1::ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get v1_articles_index_url
    assert_response :success
  end
end
