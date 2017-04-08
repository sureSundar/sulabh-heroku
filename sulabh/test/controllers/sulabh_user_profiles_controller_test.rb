require 'test_helper'

class SulabhUserProfilesControllerTest < ActionController::TestCase
  setup do
    @sulabh_user_profile = sulabh_user_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sulabh_user_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sulabh_user_profile" do
    assert_difference('SulabhUserProfile.count') do
      post :create, sulabh_user_profile: { aadhar: @sulabh_user_profile.aadhar, accountno: @sulabh_user_profile.accountno, address_id: @sulabh_user_profile.address_id, bank: @sulabh_user_profile.bank, email: @sulabh_user_profile.email, ifsc: @sulabh_user_profile.ifsc, locale: @sulabh_user_profile.locale, mobile: @sulabh_user_profile.mobile, monthlyrevenue: @sulabh_user_profile.monthlyrevenue, name: @sulabh_user_profile.name, occupation: @sulabh_user_profile.occupation }
    end

    assert_redirected_to sulabh_user_profile_path(assigns(:sulabh_user_profile))
  end

  test "should show sulabh_user_profile" do
    get :show, id: @sulabh_user_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sulabh_user_profile
    assert_response :success
  end

  test "should update sulabh_user_profile" do
    patch :update, id: @sulabh_user_profile, sulabh_user_profile: { aadhar: @sulabh_user_profile.aadhar, accountno: @sulabh_user_profile.accountno, address_id: @sulabh_user_profile.address_id, bank: @sulabh_user_profile.bank, email: @sulabh_user_profile.email, ifsc: @sulabh_user_profile.ifsc, locale: @sulabh_user_profile.locale, mobile: @sulabh_user_profile.mobile, monthlyrevenue: @sulabh_user_profile.monthlyrevenue, name: @sulabh_user_profile.name, occupation: @sulabh_user_profile.occupation }
    assert_redirected_to sulabh_user_profile_path(assigns(:sulabh_user_profile))
  end

  test "should destroy sulabh_user_profile" do
    assert_difference('SulabhUserProfile.count', -1) do
      delete :destroy, id: @sulabh_user_profile
    end

    assert_redirected_to sulabh_user_profiles_path
  end
end
