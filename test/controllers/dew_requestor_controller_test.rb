require 'test_helper'

class DewRequestorControllerTest < ActionController::TestCase
  test "should get dashboard" do
    get :dashboard
    assert_response :success
  end

  test "should get createLR" do
    get :createLR
    assert_response :success
  end

  test "should get myrequests" do
    get :myrequests
    assert_response :success
  end

  test "should get offerLR" do
    get :offerLR
    assert_response :success
  end

end
