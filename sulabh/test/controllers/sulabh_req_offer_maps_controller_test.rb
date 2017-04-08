require 'test_helper'

class SulabhReqOfferMapsControllerTest < ActionController::TestCase
  setup do
    @sulabh_req_offer_map = sulabh_req_offer_maps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sulabh_req_offer_maps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sulabh_req_offer_map" do
    assert_difference('SulabhReqOfferMap.count') do
      post :create, sulabh_req_offer_map: { offer_id: @sulabh_req_offer_map.offer_id, request_id: @sulabh_req_offer_map.request_id, status: @sulabh_req_offer_map.status }
    end

    assert_redirected_to sulabh_req_offer_map_path(assigns(:sulabh_req_offer_map))
  end

  test "should show sulabh_req_offer_map" do
    get :show, id: @sulabh_req_offer_map
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sulabh_req_offer_map
    assert_response :success
  end

  test "should update sulabh_req_offer_map" do
    patch :update, id: @sulabh_req_offer_map, sulabh_req_offer_map: { offer_id: @sulabh_req_offer_map.offer_id, request_id: @sulabh_req_offer_map.request_id, status: @sulabh_req_offer_map.status }
    assert_redirected_to sulabh_req_offer_map_path(assigns(:sulabh_req_offer_map))
  end

  test "should destroy sulabh_req_offer_map" do
    assert_difference('SulabhReqOfferMap.count', -1) do
      delete :destroy, id: @sulabh_req_offer_map
    end

    assert_redirected_to sulabh_req_offer_maps_path
  end
end
