require 'test_helper'

class SulabhLoanConfirmsControllerTest < ActionController::TestCase
  setup do
    @sulabh_loan_confirm = sulabh_loan_confirms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sulabh_loan_confirms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sulabh_loan_confirm" do
    assert_difference('SulabhLoanConfirm.count') do
      post :create, sulabh_loan_confirm: { financedetails_id: @sulabh_loan_confirm.financedetails_id, offer_id: @sulabh_loan_confirm.offer_id, policyno_id: @sulabh_loan_confirm.policyno_id, request_id: @sulabh_loan_confirm.request_id }
    end

    assert_redirected_to sulabh_loan_confirm_path(assigns(:sulabh_loan_confirm))
  end

  test "should show sulabh_loan_confirm" do
    get :show, id: @sulabh_loan_confirm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sulabh_loan_confirm
    assert_response :success
  end

  test "should update sulabh_loan_confirm" do
    patch :update, id: @sulabh_loan_confirm, sulabh_loan_confirm: { financedetails_id: @sulabh_loan_confirm.financedetails_id, offer_id: @sulabh_loan_confirm.offer_id, policyno_id: @sulabh_loan_confirm.policyno_id, request_id: @sulabh_loan_confirm.request_id }
    assert_redirected_to sulabh_loan_confirm_path(assigns(:sulabh_loan_confirm))
  end

  test "should destroy sulabh_loan_confirm" do
    assert_difference('SulabhLoanConfirm.count', -1) do
      delete :destroy, id: @sulabh_loan_confirm
    end

    assert_redirected_to sulabh_loan_confirms_path
  end
end
