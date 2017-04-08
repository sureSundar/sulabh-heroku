require 'test_helper'

class SulabhPasswordsControllerTest < ActionController::TestCase
  setup do
    @sulabh_password = sulabh_passwords(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sulabh_passwords)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sulabh_password" do
    assert_difference('SulabhPassword.count') do
      post :create, sulabh_password: { expiry: @sulabh_password.expiry, password: @sulabh_password.password, pin: @sulabh_password.pin }
    end

    assert_redirected_to sulabh_password_path(assigns(:sulabh_password))
  end

  test "should show sulabh_password" do
    get :show, id: @sulabh_password
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sulabh_password
    assert_response :success
  end

  test "should update sulabh_password" do
    patch :update, id: @sulabh_password, sulabh_password: { expiry: @sulabh_password.expiry, password: @sulabh_password.password, pin: @sulabh_password.pin }
    assert_redirected_to sulabh_password_path(assigns(:sulabh_password))
  end

  test "should destroy sulabh_password" do
    assert_difference('SulabhPassword.count', -1) do
      delete :destroy, id: @sulabh_password
    end

    assert_redirected_to sulabh_passwords_path
  end
end
