require 'test_helper'

class SulabhPolicyClaimsControllerTest < ActionController::TestCase
  setup do
    @sulabh_policy_claim = sulabh_policy_claims(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sulabh_policy_claims)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sulabh_policy_claim" do
    assert_difference('SulabhPolicyClaim.count') do
      post :create, sulabh_policy_claim: { claimedamount: @sulabh_policy_claim.claimedamount, claimno: @sulabh_policy_claim.claimno, claimstatus: @sulabh_policy_claim.claimstatus, policyno: @sulabh_policy_claim.policyno, settlementamount: @sulabh_policy_claim.settlementamount }
    end

    assert_redirected_to sulabh_policy_claim_path(assigns(:sulabh_policy_claim))
  end

  test "should show sulabh_policy_claim" do
    get :show, id: @sulabh_policy_claim
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sulabh_policy_claim
    assert_response :success
  end

  test "should update sulabh_policy_claim" do
    patch :update, id: @sulabh_policy_claim, sulabh_policy_claim: { claimedamount: @sulabh_policy_claim.claimedamount, claimno: @sulabh_policy_claim.claimno, claimstatus: @sulabh_policy_claim.claimstatus, policyno: @sulabh_policy_claim.policyno, settlementamount: @sulabh_policy_claim.settlementamount }
    assert_redirected_to sulabh_policy_claim_path(assigns(:sulabh_policy_claim))
  end

  test "should destroy sulabh_policy_claim" do
    assert_difference('SulabhPolicyClaim.count', -1) do
      delete :destroy, id: @sulabh_policy_claim
    end

    assert_redirected_to sulabh_policy_claims_path
  end
end
