require 'test_helper'

class BookmarkControllerTest < ActionController::TestCase
  test "should get get" do
    get :get
    assert_response :success
  end

  test "should get post" do
    get :post
    assert_response :success
  end

  test "should get put" do
    get :put
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

end
