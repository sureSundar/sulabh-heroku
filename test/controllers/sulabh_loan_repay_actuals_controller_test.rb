require 'test_helper'

class SulabhLoanRepayActualsControllerTest < ActionController::TestCase
  setup do
    @sulabh_loan_repay_actual = sulabh_loan_repay_actuals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sulabh_loan_repay_actuals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sulabh_loan_repay_actual" do
    assert_difference('SulabhLoanRepayActual.count') do
      post :create, sulabh_loan_repay_actual: { actdueafterinst: @sulabh_loan_repay_actual.actdueafterinst, actinterest: @sulabh_loan_repay_actual.actinterest, datepaid: @sulabh_loan_repay_actual.datepaid, installment_amount: @sulabh_loan_repay_actual.installment_amount, installment_no: @sulabh_loan_repay_actual.installment_no, sulabh_loan_confim_id_id: @sulabh_loan_repay_actual.sulabh_loan_confim_id_id }
    end

    assert_redirected_to sulabh_loan_repay_actual_path(assigns(:sulabh_loan_repay_actual))
  end

  test "should show sulabh_loan_repay_actual" do
    get :show, id: @sulabh_loan_repay_actual
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sulabh_loan_repay_actual
    assert_response :success
  end

  test "should update sulabh_loan_repay_actual" do
    patch :update, id: @sulabh_loan_repay_actual, sulabh_loan_repay_actual: { actdueafterinst: @sulabh_loan_repay_actual.actdueafterinst, actinterest: @sulabh_loan_repay_actual.actinterest, datepaid: @sulabh_loan_repay_actual.datepaid, installment_amount: @sulabh_loan_repay_actual.installment_amount, installment_no: @sulabh_loan_repay_actual.installment_no, sulabh_loan_confim_id_id: @sulabh_loan_repay_actual.sulabh_loan_confim_id_id }
    assert_redirected_to sulabh_loan_repay_actual_path(assigns(:sulabh_loan_repay_actual))
  end

  test "should destroy sulabh_loan_repay_actual" do
    assert_difference('SulabhLoanRepayActual.count', -1) do
      delete :destroy, id: @sulabh_loan_repay_actual
    end

    assert_redirected_to sulabh_loan_repay_actuals_path
  end
end
