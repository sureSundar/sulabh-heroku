require 'test_helper'

class SulabhRolesControllerTest < ActionController::TestCase
  setup do
    @sulabh_role = sulabh_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sulabh_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sulabh_role" do
    assert_difference('SulabhRole.count') do
      post :create, sulabh_role: { role: @sulabh_role.role }
    end

    assert_redirected_to sulabh_role_path(assigns(:sulabh_role))
  end

  test "should show sulabh_role" do
    get :show, id: @sulabh_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sulabh_role
    assert_response :success
  end

  test "should update sulabh_role" do
    patch :update, id: @sulabh_role, sulabh_role: { role: @sulabh_role.role }
    assert_redirected_to sulabh_role_path(assigns(:sulabh_role))
  end

  test "should destroy sulabh_role" do
    assert_difference('SulabhRole.count', -1) do
      delete :destroy, id: @sulabh_role
    end

    assert_redirected_to sulabh_roles_path
  end
end
