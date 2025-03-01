require "test_helper"

class DrinksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get drinks_index_url
    assert_response :success
  end

  test "should get details" do
    get drinks_details_url
    assert_response :success
  end
end
