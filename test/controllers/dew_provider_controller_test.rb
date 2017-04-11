require 'test_helper'

class DewProviderControllerTest < ActionController::TestCase
  test "should get dashboard" do
    get :dashboard
    assert_response :success
  end

  test "should get offer" do
    get :offer
    assert_response :success
  end

  test "should get LRoffer" do
    get :LRoffer
    assert_response :success
  end

end
