require 'test_helper'

class SulabhPoliciesControllerTest < ActionController::TestCase
  setup do
    @sulabh_policy = sulabh_policies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sulabh_policies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sulabh_policy" do
    assert_difference('SulabhPolicy.count') do
      post :create, sulabh_policy: { enddate: @sulabh_policy.enddate, policyno: @sulabh_policy.policyno, premium: @sulabh_policy.premium, provider: @sulabh_policy.provider, scheme: @sulabh_policy.scheme, startdate: @sulabh_policy.startdate }
    end

    assert_redirected_to sulabh_policy_path(assigns(:sulabh_policy))
  end

  test "should show sulabh_policy" do
    get :show, id: @sulabh_policy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sulabh_policy
    assert_response :success
  end

  test "should update sulabh_policy" do
    patch :update, id: @sulabh_policy, sulabh_policy: { enddate: @sulabh_policy.enddate, policyno: @sulabh_policy.policyno, premium: @sulabh_policy.premium, provider: @sulabh_policy.provider, scheme: @sulabh_policy.scheme, startdate: @sulabh_policy.startdate }
    assert_redirected_to sulabh_policy_path(assigns(:sulabh_policy))
  end

  test "should destroy sulabh_policy" do
    assert_difference('SulabhPolicy.count', -1) do
      delete :destroy, id: @sulabh_policy
    end

    assert_redirected_to sulabh_policies_path
  end
end
