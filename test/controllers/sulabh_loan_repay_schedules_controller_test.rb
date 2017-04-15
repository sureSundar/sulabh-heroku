require 'test_helper'

class SulabhLoanRepaySchedulesControllerTest < ActionController::TestCase
  setup do
    @sulabh_loan_repay_schedule = sulabh_loan_repay_schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sulabh_loan_repay_schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sulabh_loan_repay_schedule" do
    assert_difference('SulabhLoanRepaySchedule.count') do
      post :create, sulabh_loan_repay_schedule: { due_after_installment: @sulabh_loan_repay_schedule.due_after_installment, installment_amount: @sulabh_loan_repay_schedule.installment_amount, installment_due_date: @sulabh_loan_repay_schedule.installment_due_date, installment_no: @sulabh_loan_repay_schedule.installment_no, interest_for_installment: @sulabh_loan_repay_schedule.interest_for_installment, principal: @sulabh_loan_repay_schedule.principal, sulabh_loan_confim_id_id: @sulabh_loan_repay_schedule.sulabh_loan_confim_id_id }
    end

    assert_redirected_to sulabh_loan_repay_schedule_path(assigns(:sulabh_loan_repay_schedule))
  end

  test "should show sulabh_loan_repay_schedule" do
    get :show, id: @sulabh_loan_repay_schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sulabh_loan_repay_schedule
    assert_response :success
  end

  test "should update sulabh_loan_repay_schedule" do
    patch :update, id: @sulabh_loan_repay_schedule, sulabh_loan_repay_schedule: { due_after_installment: @sulabh_loan_repay_schedule.due_after_installment, installment_amount: @sulabh_loan_repay_schedule.installment_amount, installment_due_date: @sulabh_loan_repay_schedule.installment_due_date, installment_no: @sulabh_loan_repay_schedule.installment_no, interest_for_installment: @sulabh_loan_repay_schedule.interest_for_installment, principal: @sulabh_loan_repay_schedule.principal, sulabh_loan_confim_id_id: @sulabh_loan_repay_schedule.sulabh_loan_confim_id_id }
    assert_redirected_to sulabh_loan_repay_schedule_path(assigns(:sulabh_loan_repay_schedule))
  end

  test "should destroy sulabh_loan_repay_schedule" do
    assert_difference('SulabhLoanRepaySchedule.count', -1) do
      delete :destroy, id: @sulabh_loan_repay_schedule
    end

    assert_redirected_to sulabh_loan_repay_schedules_path
  end
end
