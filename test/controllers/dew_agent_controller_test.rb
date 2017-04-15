require 'test_helper'

class DewAgentControllerTest < ActionController::TestCase
  test "should get dashboard" do
    get :dashboard
    assert_response :success
  end

  test "should get searchByAadhar" do
    get :searchByAadhar
    assert_response :success
  end

  test "should get collectpament" do
    get :collectpament
    assert_response :success
  end

  test "should get collectsaving" do
    get :collectsaving
    assert_response :success
  end

  test "should get collectEMI" do
    get :collectEMI
    assert_response :success
  end

  test "should get reconcile" do
    get :reconcile
    assert_response :success
  end

end
