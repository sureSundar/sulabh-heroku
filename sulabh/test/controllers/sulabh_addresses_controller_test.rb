require 'test_helper'

class SulabhAddressesControllerTest < ActionController::TestCase
  setup do
    @sulabh_address = sulabh_addresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sulabh_addresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sulabh_address" do
    assert_difference('SulabhAddress.count') do
      post :create, sulabh_address: { address1: @sulabh_address.address1, address2: @sulabh_address.address2, address3: @sulabh_address.address3, city: @sulabh_address.city, country: @sulabh_address.country, pincode: @sulabh_address.pincode }
    end

    assert_redirected_to sulabh_address_path(assigns(:sulabh_address))
  end

  test "should show sulabh_address" do
    get :show, id: @sulabh_address
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sulabh_address
    assert_response :success
  end

  test "should update sulabh_address" do
    patch :update, id: @sulabh_address, sulabh_address: { address1: @sulabh_address.address1, address2: @sulabh_address.address2, address3: @sulabh_address.address3, city: @sulabh_address.city, country: @sulabh_address.country, pincode: @sulabh_address.pincode }
    assert_redirected_to sulabh_address_path(assigns(:sulabh_address))
  end

  test "should destroy sulabh_address" do
    assert_difference('SulabhAddress.count', -1) do
      delete :destroy, id: @sulabh_address
    end

    assert_redirected_to sulabh_addresses_path
  end
end
