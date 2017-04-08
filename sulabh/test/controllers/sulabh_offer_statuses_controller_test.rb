require 'test_helper'

class SulabhOfferStatusesControllerTest < ActionController::TestCase
  setup do
    @sulabh_offer_status = sulabh_offer_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sulabh_offer_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sulabh_offer_status" do
    assert_difference('SulabhOfferStatus.count') do
      post :create, sulabh_offer_status: { offer_id: @sulabh_offer_status.offer_id, status: @sulabh_offer_status.status }
    end

    assert_redirected_to sulabh_offer_status_path(assigns(:sulabh_offer_status))
  end

  test "should show sulabh_offer_status" do
    get :show, id: @sulabh_offer_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sulabh_offer_status
    assert_response :success
  end

  test "should update sulabh_offer_status" do
    patch :update, id: @sulabh_offer_status, sulabh_offer_status: { offer_id: @sulabh_offer_status.offer_id, status: @sulabh_offer_status.status }
    assert_redirected_to sulabh_offer_status_path(assigns(:sulabh_offer_status))
  end

  test "should destroy sulabh_offer_status" do
    assert_difference('SulabhOfferStatus.count', -1) do
      delete :destroy, id: @sulabh_offer_status
    end

    assert_redirected_to sulabh_offer_statuses_path
  end
end
