require 'test_helper'

class SulabhUserRolesControllerTest < ActionController::TestCase
  setup do
    @sulabh_user_role = sulabh_user_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sulabh_user_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sulabh_user_role" do
    assert_difference('SulabhUserRole.count') do
      post :create, sulabh_user_role: { role_id: @sulabh_user_role.role_id, username_id: @sulabh_user_role.username_id }
    end

    assert_redirected_to sulabh_user_role_path(assigns(:sulabh_user_role))
  end

  test "should show sulabh_user_role" do
    get :show, id: @sulabh_user_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sulabh_user_role
    assert_response :success
  end

  test "should update sulabh_user_role" do
    patch :update, id: @sulabh_user_role, sulabh_user_role: { role_id: @sulabh_user_role.role_id, username_id: @sulabh_user_role.username_id }
    assert_redirected_to sulabh_user_role_path(assigns(:sulabh_user_role))
  end

  test "should destroy sulabh_user_role" do
    assert_difference('SulabhUserRole.count', -1) do
      delete :destroy, id: @sulabh_user_role
    end

    assert_redirected_to sulabh_user_roles_path
  end
end
