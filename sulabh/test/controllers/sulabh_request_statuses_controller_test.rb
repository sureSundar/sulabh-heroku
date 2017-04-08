require 'test_helper'

class SulabhRequestStatusesControllerTest < ActionController::TestCase
  setup do
    @sulabh_request_status = sulabh_request_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sulabh_request_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sulabh_request_status" do
    assert_difference('SulabhRequestStatus.count') do
      post :create, sulabh_request_status: { request_id: @sulabh_request_status.request_id, status: @sulabh_request_status.status }
    end

    assert_redirected_to sulabh_request_status_path(assigns(:sulabh_request_status))
  end

  test "should show sulabh_request_status" do
    get :show, id: @sulabh_request_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sulabh_request_status
    assert_response :success
  end

  test "should update sulabh_request_status" do
    patch :update, id: @sulabh_request_status, sulabh_request_status: { request_id: @sulabh_request_status.request_id, status: @sulabh_request_status.status }
    assert_redirected_to sulabh_request_status_path(assigns(:sulabh_request_status))
  end

  test "should destroy sulabh_request_status" do
    assert_difference('SulabhRequestStatus.count', -1) do
      delete :destroy, id: @sulabh_request_status
    end

    assert_redirected_to sulabh_request_statuses_path
  end
end
