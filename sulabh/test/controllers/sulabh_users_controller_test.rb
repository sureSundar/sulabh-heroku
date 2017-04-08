require 'test_helper'

class SulabhUsersControllerTest < ActionController::TestCase
  setup do
    @sulabh_user = sulabh_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sulabh_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sulabh_user" do
    assert_difference('SulabhUser.count') do
      post :create, sulabh_user: { password_id: @sulabh_user.password_id, username: @sulabh_user.username }
    end

    assert_redirected_to sulabh_user_path(assigns(:sulabh_user))
  end

  test "should show sulabh_user" do
    get :show, id: @sulabh_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sulabh_user
    assert_response :success
  end

  test "should update sulabh_user" do
    patch :update, id: @sulabh_user, sulabh_user: { password_id: @sulabh_user.password_id, username: @sulabh_user.username }
    assert_redirected_to sulabh_user_path(assigns(:sulabh_user))
  end

  test "should destroy sulabh_user" do
    assert_difference('SulabhUser.count', -1) do
      delete :destroy, id: @sulabh_user
    end

    assert_redirected_to sulabh_users_path
  end
end
