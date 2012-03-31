require 'test_helper'

class ChannelControllerTest < ActionController::TestCase
  test "should get access" do
    get :access
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

end
